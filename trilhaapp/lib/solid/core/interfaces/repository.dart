abstract class Repository<T> {
  Future<List<T>> fetchDataAll();
  Future<T> fetchDataById();
  Future<void> save();
  Future<void> uptade();
  Future<void> delete();
}
