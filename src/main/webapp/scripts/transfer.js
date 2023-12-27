
   function home() {
		window.location.href="http://localhost:9101/mainpage";
	}
        $(document).ready(function() {
            $("input[name='bankType']").change(function() {
                var selectedValue = $("input[name='bankType']:checked").val();
                if (selectedValue === "sameBank") {
                  $("#bankFormContainer").html($("#sameBankForm").html());
              } else if (selectedValue === "otherBank") {
                    $("#bankFormContainer").html($("#otherBankForm").html());
                }
            });//input[name='bankType']
        });//(document).ready(function() 
        function getAutocompleteSuggestions() {
            var input = document.getElementById("accountHolderName").value;
            
            $.ajax({
                url: "http://localhost:9100/autocomplete",
                type: 'GET',
                data: {
                    query: input
                },
                success: function(data) {
                    updateSuggestions(data);
                },
                error: function(x,err) {
                    alert(error);
                }
            });//$.ajax({
        }// getAutocompleteSuggestions(

        function updateSuggestions(suggestions) {
            var suggestionsDiv = document.getElementById("suggestions");
            suggestionsDiv.innerHTML = "";

            suggestions.forEach(function(suggestion) {
                var suggestionElement = document.createElement("div");
                suggestionElement.textContent = suggestion;
                suggestionsDiv.appendChild(suggestionElement);
            });//suggestions.forEach
        }//updateSuggestions(suggestions)