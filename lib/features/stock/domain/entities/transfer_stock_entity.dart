class TransferStockEntity{
  final String productId;
  final int quantity;
  final String sourceWareId;
  final String targetWareId;

  TransferStockEntity(this.productId, this.quantity, this.sourceWareId, this.targetWareId);
}