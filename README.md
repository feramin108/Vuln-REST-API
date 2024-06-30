# Vuln-REST-API
This project, "Goat," is intended to assist you become familiar with REST API testing. It includes a Postman project that shows how each API request should be done. If you run into any problems with the API components, please file an issue.

# Setup:
Verify your ability to run **pipenv**. On Macs, this is simple to install after homebrew is installed. 

- pipenv shell
- pip install flask
- export FLASK_APP=server.py
- flask run

  If everything is set up correctly, you should be able to access the Goat project by opening your web browser and entering the following URL: http://localhost:5000

  # Using Docker
 - docker build -t rest-api-goat:latest .
 - docker run -d -p 5000:5000 rest-api-goat
 - Test at http://localhost:5000/


# What aspects should be tested?
The starting point for this question is always to understand the threat model of the API. If you're considering potential threats from an attacker like Billy Badguy, you need to think about what actions Billy might want to take. Billy isn't interested in conventional employment; instead, he's looking for ways to generate income, possibly through malicious activities.

You can find clues and hints in the "Guide" folder of the project to help you uncover more details independently.

 # API Documentation & Methods 

 This API emulates a multi-tenant banking platform, where each bank is authenticated using its unique API token. It ensures that banks can exclusively access data pertaining to their own customers without any visibility into the balances of customers from other banks. The server-side logic is implemented in Python using Flask, with data storage managed through SQLite, functioning akin to a SQL server.
 ## Methods

### Authenticate

Verifies the validity of an API token and provides information about the current user.
### Get Customers

Retrieves a list of all customers associated with the authenticated bank, including their balances.
### Get Customer v1

Initial version for retrieving details about a specific customer. Known to have security issues, prompting a rewrite.
### Get Customer v2

Updated version claimed to address security flaws from v1. Requires validation.
### Transfers

Handling of money transfers in three steps: creation, batching, and completion.

- #### Create Transfer: 
Initiates a transfer with sender, receiver, and amount details.

- #### Process Transfers: 
Evaluates and potentially batches transfers for efficiency.

- #### Confirm Transfer: 
Finalizes a pending transfer, adjusting customer balances accordingly.

- #### Get Transfers

Retrieves a list of all transfers in the system, with filtering options by state (e.g., CREATED, PENDING, COMPLETE).

### Delete Token

Removes a specified access token. Note: There is a known bug where deleting all tokens associated with a company can result in access issues. To resolve this, run python install_db.py to reset everything.


### Create Access Token

Generates a new access token associated with the current user's company. Banks typically utilize this to assign unique IDs to their API clients.



