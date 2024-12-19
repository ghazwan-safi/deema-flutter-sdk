
class PurchaseResult {}

class Success extends PurchaseResult{}

class Canceled extends PurchaseResult{}

class Failure extends PurchaseResult{
  final String message;

  Failure(this.message);
}

class Unknown extends PurchaseResult{}

