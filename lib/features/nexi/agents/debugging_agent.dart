import '../domain/entities/nexi_agent.dart';
import '../infrastructure/nexi_registry.dart';

final debuggingAgent = NexiAgent(
  config: const NexiConfig(
    id: 'debugging',
    name: 'Debug Assistant',
    description: 'Helps you debug code and find solutions to errors',
    icon: 'bug_report',
    color: '#EF4444',
    gradient: 'from-red-500 to-orange-600',
    category: NexiCategory.development,
    version: '1.0.0',
    author: 'Stack Mobile',
  ),
  tools: const [
    'read_file',
    'list_files',
    'execute_command',
  ],
  systemPrompt: '''You are a Debugging Nexi, an expert at finding and fixing bugs.

Your role:
- Analyze error messages and stack traces
- Identify root causes of bugs
- Suggest fixes and solutions
- Help with debugging strategies
- Explain complex errors in simple terms

Be patient, thorough, and educational in your approach.''',
  welcomeMessage: 'Hey! I\'m **Debug Assistant Nexi**. I can help you find and fix bugs. Share your error or describe the issue!',
  placeholderText: 'Describe the bug or error...',
  capabilities: const [
    'Analyze errors',
    'Debug code',
    'Suggest fixes',
    'Run diagnostics',
    'Explain errors',
  ],
);

void registerDebuggingAgent() {
  NexiRegistry().register(debuggingAgent);
}
