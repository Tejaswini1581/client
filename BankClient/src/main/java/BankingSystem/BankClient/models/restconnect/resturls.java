package BankingSystem.BankClient.models.restconnect;

public class resturls {
	public static final String GET_DATA="http://localhost:9100/getbyaccountholdername/{name}/{bank}"; 
	public static final String GET_SUGGESTIONS="http://localhost:9100/autosuggestions/{name}";

	public static final String GET_PENDING_FEEDBACKS="http://localhost:9100/getPendingContacts";
	public static final String GET_ALL_CONTACT="http://localhost:9100/getContactUs";
	public static final String GET_CONTACT_BY_ID="http://localhost:9100/getContactUs/{id}";
	public static final String SAVE_CONTACT="http://localhost:9100/insertContactUs";
	public static final String UPDATE_CONTACT_BY_ID="http://localhost:9100/updateContactUs/{id}";
	public static final String DELETE_CONTACT_BY_ID="http://localhost:9100/deleteContactUs/{id}";

	public static final String GET_ALL_ACTIVITY="http://localhost:9100/getActivity";
	public static final String GET_ACTIVITY_BY_ID="http://localhost:9100/getActivity/{id}";
	public static final String SAVE_ACTIVITY="http://localhost:9100/insertActivity";
	public static final String UPDATE_ACTIVITY_BY_ID="http://localhost:9100/updateActivity/{id}";
	
	public static final String GET_ALL_ACCOUNTS="http://localhost:9100/getAccounts";
	public static final String GET_ACCOUNTS_BY_ID="http://localhost:9100/getAccount/{id}";
	public static final String SAVE_ACCOUNTS="http://localhost:9100/insertAccount";
	public static final String UPDATE_ACCOUNTS_BY_ID="http://localhost:9100/updateAccount/{id}";
	public static final String DELETE_ACCOUNTS_BY_ID="http://localhost:9100/deleteAccount/{id}";

	public static final String GET_ALL_ADMINS="http://localhost:9100/getAdmins";
	public static final String GET_ADMINS_BY_ID="http://localhost:9100/getAdmin/{id}";
	public static final String SAVE_ADMINS="http://localhost:9100/insertAdmin";
	public static final String UPDATE_ADMINS_BY_ID="http://localhost:9100/updateAdmin/{id}";
	public static final String DELETE_ADMINS_BY_ID="http://localhost:9100/deleteAdmin/{id}";

	public static final String GET_ALL_CUSTOMERS="http://localhost:9100/getCustomers";
	public static final String GET_PENDING_CUSTOMERS="http://localhost:9100/getPendingCustomers";
	public static final String GET_CUSTOMERS_BY_ID="http://localhost:9100/getCustomer/{id}";
	public static final String SAVE_CUSTOMERS="http://localhost:9100/insertCustomer";
	public static final String UPDATE_CUSTOMERS_BY_ID="http://localhost:9100/updateCustomer/{id}";
	public static final String DELETE_CUSTOMERS_BY_ID="http://localhost:9100/deleteCustomer/{id}";

	public static final String GET_ALL_RECEIVERACCOUNTS="http://localhost:9100/getReceiverAccounts";
	public static final String GET_RECEIVERACCOUNTS_BY_ID="http://localhost:9100/getReceiverAccount/{id}";
	public static final String SAVE_RECEIVERACCOUNTS="http://localhost:9100/insertReceiverAccount";
	public static final String UPDATE_RECEIVERACCOUNTS_BY_ID="http://localhost:9100/updateReceiverAccount/{id}";
	public static final String DELETE_RECEIVERACCOUNTS_BY_ID="http://localhost:9100/deleteReceiverAccount/{id}";

	public static final String GET_ALL_TRANSACTIONS="http://localhost:9100/getTransactions";
	public static final String GET_TRANSACTIONS_BY_ID="http://localhost:9100/getTransaction/{id}";
	public static final String GET_TRANSACTIONS_BY_ACCOUNTID="http://localhost:9100/getTransactionsByAccountId/{id}";
	public static final String SAVE_TRANSACTIONS="http://localhost:9100/insertTransaction";
	public static final String UPDATE_TRANSACTIONS_BY_ID="http://localhost:9100/updateTransaction/{id}";
	public static final String DELETE_TRANSACTIONS_BY_ID="http://localhost:9100/deleteTransaction/{id}";

	public static final String GET_ALL_TRANSFERS="http://localhost:9100/getTransfers";
	public static final String GET_TRANSFERS_BY_ID="http://localhost:9100/getTransfer/{id}";
	public static final String GET_TRANSFERS_BY_ACCOUNTID="http://localhost:9100/getTransfersByAccountId/{id}";
	public static final String GET_TRANSFERS_BY_ACCOUNT_NAME="http://localhost:9100/getTransfersByDestinationAccountName/{id}";
	public static final String SAVE_TRANSFERS="http://localhost:9100/insertTransfer";
	public static final String SAVE_BOTH_TRANSFERS="http://localhost:9100/saveTransfer/{id}/{bal}";
	public static final String UPDATE_TRANSFERS_BY_ID="http://localhost:9100/updateTransfer/{id}";
	public static final String DELETE_TRANSFERS_BY_ID="http://localhost:9100/deleteTransfer/{id}";

}
