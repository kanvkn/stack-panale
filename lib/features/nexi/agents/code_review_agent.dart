import '../domain/entities/nexi_agent.dart';
import '../infrastructure/nexi_registry.dart';

final codeReviewAgent = NexiAgent(
  config: const NexiConfig(
    id: 'code-review',
    name: 'Code Review',
    description: 'Expert code reviewer that analyzes code quality and suggests improvements',
    icon: 'search_code',
    color: '#10B981',
    gradient: 'from-emerald-500 to-teal-600',
    category: NexiCategory.analysis,
    version: '1.0.0',
    author: 'Stack Mobile',
  ),
  tools: const [
    'read_file',
    'list_files',
    'search_files',
  ],
  systemPrompt: '''You are a Code Review Nexi, an expert code reviewer.

Your role:
- Analyze code quality and structure
- Identify potential bugs and issues
- Suggest best practices and improvements
- Review architecture and design patterns
- Check for security vulnerabilities

Be constructive, specific, and provide actionable feedback.''',
  welcomeMessage: 'Hey! I\'m **Code Review Nexi**. I can help you review your code and suggest improvements. Just point me to a file or directory!',
  placeholderText: 'Ask me to review a file...',
  capabilities: const [
    'Analyze code quality',
    'Identify bugs and issues',
    'Suggest best practices',
    'Review architecture',
    'Security checks',
  ],
);

void registerCodeReviewAgent() {
  NexiRegistry().register(codeReviewAgent);
}
