import 'package:floor/floor.dart';
import 'package:my_app/entity/cart.dart';

@dao
abstract class CartDAO {
  @Query('Select * FROM Cart WHERE uid=:uid')
  Stream<List<Cart>> getAllItemInCartByUid(String uid);

  @Query('Select * FROM Cart WHERE uid=:uid AND id=:id')
  Future<Cart?> getItemCartByUid(String uid, String id);

  @Query('DELETE FROM Cart WHERE uid=:uid ')
  Stream<List<Cart>> clearCartByUid(String uid);

  @insert
  Future<void> insertCart(Cart product);

  @update
  Future<int> updateCart(Cart product);

  @delete
  Future<int> deleteCart(Cart product);
}
