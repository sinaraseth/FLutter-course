class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance = 0.0;

  // Constructor
  BankAccount(this.accountId, this.accountOwner);

  // Method to return the current balance
  double get balance => _balance;

  // Method to credit an amount to the account
  void credit(double amount) {
    _balance += amount;
  }

  // Method to withdraw an amount from the account
  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {};

  // Constructor
  Bank({required this.name});

  // Method to create a new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    var newAccount = BankAccount(accountId, accountOwner);
    _accounts[accountId] = newAccount;
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print('Balance: \$${ronanAccount.balance}'); // Balance: $0
  ronanAccount.credit(100);
  print('Balance: \$${ronanAccount.balance}'); // Balance: $100
  ronanAccount.withdraw(50);
  print('Balance: \$${ronanAccount.balance}'); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
