class BankAccount {
  int _accountID;
  String _accountOwner;
  double _balance;
  
  BankAccount(this._accountID, this._accountOwner, [this._balance=0]);
  //return current balance
  double get balance => _balance;
  //method to credit amount
  void credit(double amount){
    _balance += amount;
  }
  //method to withdraw amount
  void withdraw(double amount){
    if(_balance - amount < 0)
    {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
  //getter for account details
  int get accountID => _accountID;
  String get accountOwner =>_accountOwner;

  @override
  String toString(){
    return 'BankAccount(ID: $_accountID, Owner: $_accountOwner, Balance: \$_$_balance)';
  }

}

class Bank {
  String name;
  List<BankAccount> _accounts = [];

  Bank(this.name);

  //create account
  BankAccount createAcc(int accountID, String accountOwner){
    //check for account existence
    for(var account in _accounts){
      if(account.accountID == accountID){
        throw Exception('Account with ID $accountID already exists!');
      }
    }
    var bankAccount = BankAccount(accountID, accountOwner);
    var newAcc = bankAccount;
    _accounts.add(newAcc);
    return newAcc;
  }
  //get account lists
  List<BankAccount> get accounts => _accounts;
}
 
void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount rajanaAccount = myBank.createAcc(111, 'Rajana');

  print(rajanaAccount.balance); // Balance: $0
  rajanaAccount.credit(111);
  print(rajanaAccount.balance); // Balance: $100
  rajanaAccount.withdraw(50);
  print(rajanaAccount.balance); // Balance: $50

  try {
    rajanaAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAcc(111, 'nana'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 111 already exists!
  }
}
