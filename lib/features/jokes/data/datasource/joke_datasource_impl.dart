import 'package:jokes/config/api_client.dart';
import 'package:jokes/features/jokes/data/models/joke_model.dart';
import 'package:jokes/features/jokes/domain/datasource/joke_datasource.dart';
import 'package:jokes/features/jokes/domain/entities/joke_entity.dart';

class JokeDatasourceImpl extends JokeDatasource {
  
  final ApiClient _apiClient; 
  
  JokeDatasourceImpl({required ApiClient apiClient}) : _apiClient = apiClient; 
  @override
  Future<JokeEntity> getJoke() async {
      
    final response = await _apiClient.get(path: "jokes/random");

    if(response.statusCode != 200) {
      throw Exception("Network exception code: ${response.statusCode}");
    }

    final JokeModel model = JokeModel.fromJson(response.data);

    return JokeEntity.fromModel(model);
  }
}