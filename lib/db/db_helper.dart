import 'package:awsome_app/models/product_model.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';

class DBSQLITE{
  static var productlist= [];

  //create database
  static final String CREATE_PRODUCT_PRODUCT= '''create table $TABLE_PRODUCT (
  $COL_PRODUCT_ID integer primary key autoincrement,
  $COL_PRODUCT_NAME verchar(255),
  $COL_PRODUCT_PRICE real not null,
  $COL_PRODUCT_DATE text not null,
  $COL_PRODUCT_IMAGE text not null,
  $COL_PRODUCT_CATEGORY text not null ) ''';

  //opn product
  static Future<Database> open() async{
    final root= await getDatabasesPath();
    final dbPath=Path.join(root,'product_db');
    return  openDatabase(dbPath,version: 3, onCreate: (db,version) async {
      await db.execute(CREATE_PRODUCT_PRODUCT);
    },onUpgrade: (db,olVersion,NewVersion){
      if(NewVersion==3){
        db.execute('alter table $TABLE_PRODUCT add column $COL_PRODUCT_FAVORITE integer');

      }
    });
  }

  //insert product
  static Future<int> insert(Product product) async{
    final db =await open();
    return db.insert(TABLE_PRODUCT, product.toMap());
    
  }

  static Future<List<Product>> getAllProducts() async{
    final db=await open();
    db.query(TABLE_PRODUCT);
    //raw query
    final List<Map<String,dynamic>> productMap=await db.rawQuery('select * from $TABLE_PRODUCT');
    return List.generate(productMap.length, (index){
      return Product.fromMap(productMap[index]);
    });
  }

  static Future<int> deleteProduct(id) async{
    final db=await open();
   return db.delete(TABLE_PRODUCT,where: '$COL_PRODUCT_ID=?',whereArgs: [id]);

  }

  static Future updateIsFav(int id,int value)async{
    final db=await open();
    db.update(TABLE_PRODUCT, {COL_PRODUCT_FAVORITE:value},where: '$COL_PRODUCT_ID=?',whereArgs: [id]);
  }


}
