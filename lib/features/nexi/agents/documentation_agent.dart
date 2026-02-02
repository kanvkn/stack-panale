import '../domain/entities/nexi_agent.dart';
import '../infrastructure/nexi_registry.dart';

final documentationAgent = NexiAgent(
  config: const NexiConfig(
    id: 'documentation',
    name: 'Doc Writer',
    description: 'Generates comprehensive documentation for your code',
    icon: 'description',
    color: '#3B82F6',
    gradient: 'from-blue-500 to-cyan-600',
    category: NexiCategory.documentation,
    version: '1.0.0',
    author: 'Stack Mobile',
  ),
  tools: const [
    'read_file',
    'list_files',
    'write_file',
  ],
  systemPrompt: '''You are a Documentation Nexi, an expert technical writer.

Your role:
- Generate clear, comprehensive documentation
- Write README files
- Create API documentation
- Add code comments
- Explain complex concepts simply

Be clear, concise, and user-friendly in your documentation.''',
  welcomeMessage: 'Hey! I\'m **Doc Writer Nexi**. I can help you create documentation for your code. What would you like to document?',
  placeholderText: 'Ask me to document a file...',
  capabilities: const [
    'Generate documentation',
    'Write README files',
    'Create API docs',
    'Add code comments',
    'Explain concepts',
  ],
);

void registerDocumentationAgent() {
  NexiRegistry().register(documentationAgent);
}
