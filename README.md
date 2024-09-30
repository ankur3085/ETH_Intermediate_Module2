# Event Management System

This Event Management System is a decentralized application (DApp) built using **React** and **Solidity**. It allows users to manage events on the Ethereum blockchain. Users can create, update, cancel, and view events using their MetaMask wallet.

## Features

- **Connect MetaMask Wallet**: Users can connect their MetaMask wallet to interact with the Ethereum blockchain.
- **Add Event**: Allows users to create a new event by specifying an event ID, name, date, and the maximum number of participants.
- **Update Event**: Users can update existing event details such as event name, date, and registration limit.
- **Cancel Event**: Users can cancel an event by providing its ID.
- **Clear All Events**: Allows users to clear all events from the contract.
- **View Events**: Displays the list of all created events, including their ID, name, date, maximum registration limit, and cancellation status.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Node.js](https://nodejs.org/)
- [MetaMask](https://metamask.io/) (installed in your browser)
- [Hardhat](https://hardhat.org/) (for local blockchain development)

## Getting Started

### Installing

**1. Clone the repository:**

   ```bash
   git clone https://github.com/IshaL-30/Smart_Bank_ATM_Intermediate_Module2.git
   ```

**2. Navigate to the project directory:**

   ```bash
   cd SmartBank-ATM
   ```

**3. Install dependencies:**

   ```bash
   npm install
   ```

### Running the Project

**1. Open a terminal and start the Hardhat local Ethereum node:**

   ```bash
   npx hardhat node
   ```

**2. Open a second terminal and deploy the smart contract to the local network:**

   ```bash
   npx hardhat run --network localhost scripts/deploy.js
   ```

**3. Open a third terminal and start the front-end development server:**

   ```bash
   npm run dev
   ```

**4. Visit the application in your browser:**

   ```bash
   Open http://localhost:3000 to interact with the SmartBank ATM.
   ```

**Connect your MetaMask wallet to the application.**

## Event Management Interface

Once the application is running, the user interface includes the following:

- **Event Input Fields**: Fields to input the event ID, name, date, and max registration limit.
- **Buttons**:
  - `Add Event`: Adds a new event to the blockchain.
  - `Update Event`: Updates details of an existing event.
  - `Clear All Events`: Clears all the events from the blockchain.
  - `Cancel Event`: Cancels a specific event.
  - `Refresh`: Refreshes the event list.
- **Event List Table**: Displays the ID, name, date, maximum registration, and status (canceled or active) of events.

## Technologies Used

- **Solidity**: Smart contract development.
- **React.js**: Frontend user interface.
- **MetaMask**: Wallet for interacting with the DApp.
- **Hardhat**: Ethereum development environment.

## How to Use

1. Open the app and connect your MetaMask wallet by clicking the **Connect to MetaMask Wallet** button.
2. Use the input fields to add or update events.
3. Use the **Clear All Events** or **Cancel Event** button to manage events.
4. The event list will be automatically refreshed after each action, or you can manually refresh by clicking the refresh icon.

## Error Handling

The system includes basic error handling:
- Alerts the user if MetaMask is not installed.
- Displays errors if the transaction fails, for instance, due to insufficient gas or invalid inputs.

## License

This project is open-source and licensed under the MIT License.
