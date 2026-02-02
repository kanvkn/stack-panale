import '../domain/entities/nexi_agent.dart';

class NexiRegistry {
  static final NexiRegistry _instance = NexiRegistry._internal();
  factory NexiRegistry() => _instance;
  NexiRegistry._internal();

  final Map<String, NexiAgent> _agents = {};

  void register(NexiAgent agent) {
    _agents[agent.config.id] = agent;
  }

  NexiAgent? get(String id) => _agents[id];

  List<NexiAgent> getAll() => _agents.values.toList();

  List<NexiAgent> getByCategory(NexiCategory category) {
    return _agents.values.where((a) => a.config.category == category).toList();
  }

  void unregister(String id) {
    _agents.remove(id);
  }

  void clear() {
    _agents.clear();
  }
}
