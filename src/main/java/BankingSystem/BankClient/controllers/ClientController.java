package BankingSystem.BankClient.controllers;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;

import BankingSystem.BankClient.models.pojo.Customer;
import BankingSystem.BankClient.models.pojo.ReceiverAccount;
import BankingSystem.BankClient.models.pojo.Transactions;
import BankingSystem.BankClient.models.pojo.Transfer;
import BankingSystem.BankClient.models.pojo.Account;
import BankingSystem.BankClient.models.pojo.Admin;
import BankingSystem.BankClient.models.pojo.Activity;
import BankingSystem.BankClient.models.pojo.display;
import BankingSystem.BankClient.models.restconnect.resturls;
import jakarta.validation.Valid;

@SessionAttributes({"user","adminID","sessionID"})
@Controller
public class ClientController {

	@Autowired
	RestTemplate restTemplate;


	@RequestMapping("/autoSuggestions") //clientController
    public String getAll(Model m) { 
        Customer cus=(Customer) m.getAttribute("user");
        if(cus==null)
            return "home";
        ResponseEntity<ReceiverAccount[]> varray = restTemplate.getForEntity(resturls.GET_SUGGESTIONS,
                ReceiverAccount[].class);
        ReceiverAccount vlist[] = varray.getBody();
        m.addAttribute("data", vlist);
        System.out.println(vlist[1].getAccountHolderName());
        return "transfer";
    }
	@RequestMapping("/balance")
	public String balance(Model M) {
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		M.addAttribute("b",cus.getAccountNo().getBalance());
		return "balance";
	}
	@RequestMapping("/home")
	public String home(Model M) {
		return "home";
	}
	@RequestMapping("/getCount")
	public String Count(@RequestParam(name = "pageIndex", defaultValue = "1") int pageIndex, Model M) {
		Activity cus=(Activity) M.getAttribute("sessionID");
		if(cus==null) 
			return "home";
		ResponseEntity<Activity[]> array = restTemplate.getForEntity(resturls.GET_ACTIVITY_BY_ID, Activity[].class,
            Map.of("id", cus.getUserId()));
		Activity list[] = array.getBody();

        List<Activity> d=new ArrayList<>();
        for (int i = 0; i < list.length; i++) {
            if(list[i].getLogoutTime()!=null)
            	d.add(list[i]);
        }
        
		M.addAttribute("list",d);
        int pageSize = 10;
        int totalRecords = d.size();
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        List<Activity> recordsToDisplay = d.subList((pageIndex - 1) * pageSize, Math.min(pageIndex * pageSize, totalRecords));
        M.addAttribute("list", recordsToDisplay); // Pass vlist as "list" to the JSP
           M.addAttribute("totalPages", totalPages);
           M.addAttribute("pageIndex", pageIndex);
		return "Count";
	}
	@RequestMapping("/help")
	public String help() {
		return "help";
	}
	@RequestMapping("/contactus")
	public String contactus() {
		return "contactus";
	}
	@RequestMapping("/profile")
	public String profile(Model M) {
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		M.addAttribute("v",cus);
		M.addAttribute("c",cus.getAccountNo());
		return "profile";
	}

	@RequestMapping("/updateCustomer")
	public String profile1(@Valid @ModelAttribute("c") Customer V, BindingResult result, Model M) {
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			String str=V.getFirstName().trim();
			V.setFirstName(str.substring(0, 1).toUpperCase() + str.substring(1));
			str=V.getLastName().trim();
			V.setLastName(str.substring(0, 1).toUpperCase() + str.substring(1));
			V.setAccountNo(cus.getAccountNo());
			V.setStatus("Accepted");
			HttpEntity<Customer> customer = new HttpEntity<>(V);
			ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_CUSTOMERS_BY_ID, HttpMethod.PUT, customer,
					String.class, Map.of("id", V.getUserId()));
			M.addAttribute("msg", "Profile "+S.getBody());
			M.addAttribute("user",V);
			M.addAttribute("v",V);
			M.addAttribute("c",V.getAccountNo());
			return "profile";
		}
		return "editCustomer";
	}
	@RequestMapping("/editCustomer")
	public String editCustomer(Model M) {
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		M.addAttribute("c",cus);
		return "editCustomer";
	}
	@RequestMapping("/aboutus")
	public String aboutus()
	{
		return "aboutus";
	}
	@RequestMapping("/services")
	public String services()
	{
		return "services";
	}
	@RequestMapping("/deposit")
	public String deposit(Model M)
	{ 
        Customer cus=(Customer) M.getAttribute("user");
        if(cus==null)
            return "home";
		Transactions t=new Transactions();
		M.addAttribute("C",t);
		return "deposit";
	}
	@RequestMapping("/deposit1")
	public String withdraw12(@Valid @ModelAttribute("C") Transactions C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		else if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				C.setTransactionType("Deposit");
				C.setAccountNo(cus.getAccountNo());
				Double b=cus.getAccountNo().getBalance()+C.getAmount();
				cus.getAccountNo().setBalance(b);
				C.setRemarks(b.toString());
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getAccountNo().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Deposited successfully.Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSACTIONS, C, String.class);
				return "deposit";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("err", E.getResponseBodyAsString());
				return "deposit";
			}
		}
		return "deposit";
	}
	@RequestMapping("/withdraw")
	public String withdraw(Model M)
	{ 
        Customer cus=(Customer) M.getAttribute("user");
        if(cus==null)
            return "home";
		Transactions t=new Transactions();
		M.addAttribute("C",t);
		return "withdraw";
	}
	@RequestMapping("/withdraw1")
	public String withdraw1(@Valid @ModelAttribute("C") Transactions C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("err", "Insufficient funds. Your balance is "+cus.getAccountNo().getBalance());
					return "withdraw";
				}
				C.setTransactionType("Withdraw");
				C.setAccountNo(cus.getAccountNo());
//				C.setTransactionId(null);
//				C.setTimestamp(null);
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				C.setRemarks(b.toString());
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getAccountNo().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Debited successfully.Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSACTIONS, C, String.class);
				return "withdraw";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("err", E.getResponseBodyAsString());
				return "withdraw";
			}
		}
		return "withdraw";
	}	

	@RequestMapping("/transfer")
	public String transfer(Model M)
	{ 
        Customer cus=(Customer) M.getAttribute("user");
        if(cus==null)
            return "home";
		M.addAttribute("C",new Transfer());
		
		return "transfer";
	}
	@RequestMapping("/transfer1")
	public String transfer1(@Valid @ModelAttribute("C") Transfer C, BindingResult result, Model M,@ModelAttribute("account_No") String idd) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if(cus.getAccountNo().getAccountNo().equals(idd)) {
			M.addAttribute("err", "Cannot tranfer to your account. Try some other account.");
			return "transfer";
		}
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
                ResponseEntity<Account> varray = restTemplate.getForEntity(resturls.GET_ACCOUNTS_BY_ID, Account.class,Map.of("id",idd));
                Account l = varray.getBody();
				if(!l.getAccountName().equalsIgnoreCase(C.getDestinationAccountName())) {
					M.addAttribute("err", "Cannot tranfer, please check account number and name again.");
					return "transfer";
					
				}
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("err", "Insufficient funds. Your balance is "+cus.getAccountNo().getBalance());
					return "transfer";
				}
				C.setTransferType("Transfer to "+C.getDestinationAccountName().toUpperCase()+"/"+idd);
				C.setSourceAccount(cus.getAccountNo());
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				C.setRemarks(b.toString());
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getSourceAccount().getAccountNo()));
				String ss=l.getAccountNo();
				l.setBalance(l.getBalance()+C.getAmount());
				HttpEntity<Account> acc = new HttpEntity<>(l);/////
				ResponseEntity<String> Sc = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, acc,
						String.class, Map.of("id", ss));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Transfered successfully to "+C.getDestinationAccountName()+". Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_BOTH_TRANSFERS, C, String.class,
						 ss,l.getBalance());
				return "transfer";
			} catch (Exception E) {
                M.addAttribute("C", C);
				M.addAttribute("err", "Cannot tranfer, please check account number and name again.");
				return "transfer";
			}
		}
		return "transfer";
	}	
	

	@RequestMapping("/transfer2")
	public String transfer2(@Valid @ModelAttribute("C") Transfer C, BindingResult result, Model M,@ModelAttribute("account_No") String idd,@ModelAttribute("searchInput") String name) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("err", "Insufficient funds. Your balance is "+cus.getAccountNo().getBalance());
					return "transfer";
				}
				C.setDestinationAccountName(name.split("-")[0]);
				C.setTransferType("Transfer to "+C.getDestinationAccountName().toUpperCase().replaceAll("\\s", "")+"/"+idd);
				C.setSourceAccount(cus.getAccountNo());
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				C.setRemarks(b.toString());
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getSourceAccount().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Transfered successfully to "+C.getDestinationAccountName()+". Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSFERS, C, String.class);
				return "transfer";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("err", E.getResponseBodyAsString());
				return "transfer";
			}
		}
		return "transfer";
	}	
	@RequestMapping("/transactionDetails")
    public String transactionDetails(@RequestParam(name = "pageIndex", defaultValue = "1") int pageIndex,Model M)
    {
         // Number of records per page     
        Customer cus=(Customer) M.getAttribute("user");
        if(cus==null)
            return "home";
        ResponseEntity<Transactions[]> varray = restTemplate.getForEntity(resturls.GET_TRANSACTIONS_BY_ACCOUNTID, Transactions[].class,
                Map.of("id", cus.getAccountNo().getAccountNo()));
        Transactions list[] = varray.getBody();
        List<display> d=new ArrayList<>();
        for (int i = 0; i < list.length; i++) {
            if(list[i].getTransactionType().equals("Withdraw"))
                d.add(new display(list[i].getTimestamp(),list[i].getTransactionType(),list[i].getTransactionId(),list[i].getAmount().toString(),null,list[i].getRemarks()));
            else
                d.add(new display(list[i].getTimestamp(),list[i].getTransactionType(),list[i].getTransactionId(),null,list[i].getAmount().toString(),list[i].getRemarks()));
            }
        ResponseEntity<Transfer[]> array = restTemplate.getForEntity(resturls.GET_TRANSFERS_BY_ACCOUNTID, Transfer[].class,
                Map.of("id", cus.getAccountNo().getAccountNo()));
        Transfer lis[] = array.getBody();
        for (int i = 0; i < lis.length; i++) {
                d.add(new display(lis[i].getTimeStamp(),lis[i].getTransferType(),lis[i].getTransferId(),lis[i].getAmount().toString(),null,lis[i].getRemarks()));
            }
        Collections.sort(d,new TimeStampSort() );
         M.addAttribute("list",d);
         M.addAttribute("aq",cus.getAccountNo());
         int pageSize = 10;
         int totalRecords = d.size();
         int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
         List<display> recordsToDisplay = d.subList((pageIndex - 1) * pageSize, Math.min(pageIndex * pageSize, totalRecords));
         M.addAttribute("list", recordsToDisplay); // Pass vlist as "list" to the JSP
            M.addAttribute("totalPages", totalPages);
            M.addAttribute("pageIndex", pageIndex);
        return "transactionDetails";
    }
	
	@RequestMapping("/loginAdmin")
	public String loginAdmin()
	{
		return "loginAdmin";
	}
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus,Model M)
	{
		Activity cus=(Activity) M.getAttribute("sessionID");
		if(cus==null) 
			return "home";
		HttpEntity<Activity> activity = new HttpEntity<>(cus);
		ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACTIVITY_BY_ID, HttpMethod.PUT, activity ,
				String.class, Map.of("id", cus.getSessionId()));
		sessionStatus.setComplete();
		return "home";
	}
	@RequestMapping("/logoutAdmin")
	public String logoutAdmin(SessionStatus sessionStatus)
	{
		sessionStatus.setComplete();
		return "home";
	}
	
	

	@RequestMapping("/insertCustomer")
	public String insertCustomer(Model M) {
		Customer c=new Customer();
		c.setAccountNo(null);
		c.setStatus("Pending");
		M.addAttribute("C", c);
		return "insertCustomer";
	}

	@RequestMapping("/insertCustomer1")
	public String insertCustomer(@Valid @ModelAttribute("C") Customer C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		if (!result.hasErrors()) {
			try {
				String str=C.getFirstName().trim();
				C.setFirstName(str.substring(0, 1).toUpperCase() + str.substring(1));
				str=C.getLastName().trim();
				C.setLastName(str.substring(0, 1).toUpperCase() + str.substring(1));
				msg = restTemplate.postForEntity(resturls.SAVE_CUSTOMERS, C, String.class);
                M.addAttribute("C", C);
				M.addAttribute("msg", msg.getBody());
				return "home";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "insertCustomer";
			}
		}
		return "insertCustomer";
	}

	@RequestMapping("/loginAdmin1")
	public String loginAdmin1(@RequestParam("adminId") String adminId,@RequestParam("password") String password,Model M)
	{
		try {
			ResponseEntity<Admin> l = restTemplate.getForEntity(resturls.GET_ADMINS_BY_ID, Admin.class,
					Map.of("id", adminId));
			Admin C = l.getBody();
			if(password.equals(C.getPassword()))
			{
				M.addAttribute("msg", "Welcome "+C.getAdminName());
				M.addAttribute("adminID", adminId);
				ResponseEntity<Customer[]> varray = restTemplate.getForEntity(resturls.GET_PENDING_CUSTOMERS, Customer[].class);
				Customer list[] = varray.getBody();
				M.addAttribute("list", list);
				return "Admin";
			}
			else
			{
				M.addAttribute("msg", "Invalid Credentials");
			}
		} catch (Exception e) {
			M.addAttribute("msg", "AdminId doesn't exist");
		}
		return "loginAdmin";
	}

	@RequestMapping("/loginCustomer")
	public String login()
	{
		return "loginCustomer";
	}
	@RequestMapping("/mainpage")
	public String mainpage(Model M)
	{
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null) 
			return "home";
		M.addAttribute("msg", "Welcome "+cus.getFirstName());
		return "main";
	}
	
	@RequestMapping("/main")
	public String home(@RequestParam("userId") String userId,@RequestParam("password") String password,Model M)
	{
		try {
			ResponseEntity<Customer> l = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer C = l.getBody();
			if(password.equals(C.getPassword()))
			{
				if(C.getStatus().equals("Accepted")) {
				Activity A=new Activity("",userId,Timestamp.from(Instant.now()),null);
				System.out.println("set");
				ResponseEntity<String> m = restTemplate.postForEntity(resturls.SAVE_ACTIVITY, A, String.class);
				A.setSessionId(m.getBody());
				M.addAttribute("sessionID", A);
				M.addAttribute("user", C);
				return "redirect:/mainpage";
				}
				else if(C.getStatus().equals("Rejected"))
				{
					M.addAttribute("msg", "Your request has been rejected");
					
				}
				else if(C.getStatus().equals("Pending"))
				{
					M.addAttribute("msg", "Your request is still pending. Please wait for the Admin approval.");
					
				}
			}
			else
			{
				M.addAttribute("msg", "Invalid Credentials");
			}
		} catch (Exception e) {
			M.addAttribute("msg", "UserId doesn't exist");
		}
		return "loginCustomer";
	}
	@RequestMapping("/details")
	public String Customer_AccountDetails(Model M) {	
		try {
			Customer cus=(Customer) M.getAttribute("user");
			Account C = cus.getAccountNo();
			M.addAttribute("A", C);	
			System.out.println(C.getBalance());
		} catch (Exception e) {
			M.addAttribute("A", new Account());	
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "getAccountById";
	}
	
	
	
	@RequestMapping("/getCustomer")
	public String Customer_getAll(Model M) {
		M.addAttribute("A", new Customer());
		return "insertCustomer";
	}
	@RequestMapping("/getCustomer1")
	public String Customer_get(Model M) {
		ResponseEntity<Customer[]> varray = restTemplate.getForEntity(resturls.GET_ALL_CUSTOMERS, Customer[].class);
		Customer list[] = varray.getBody();
		M.addAttribute("list", list);
		return "getallCustomer";
	}

	@RequestMapping("/getCustomerById")
	public String Customer_getById() {
		return "getCustomerById";
	}

	@RequestMapping("/getCustomerById1")
	public String getAll(@RequestParam("userId") String userId, Model M) {
		try {
			ResponseEntity<Customer> l = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer customer = l.getBody();
			M.addAttribute("Customer", customer);
		} catch (Exception e) {
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "getCustomerById";
	}

	@RequestMapping("/updateCustomer1")
	public String updateCustomerq(Model M) {
		M.addAttribute("A", new Customer());
		return "updateByCustomerId";
	}

	@RequestMapping("/getToUpdate/{id}")
	public String updateCustomer(@PathVariable("id") String userId, Model M) {
		try {
			ResponseEntity<Customer> v = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer Customer = v.getBody();
			System.out.println(Customer.getUserId());
			M.addAttribute("Customer", Customer);
		} catch (Exception e) {
			M.addAttribute("Customer", new Customer());
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "updateById";
	}

		
}