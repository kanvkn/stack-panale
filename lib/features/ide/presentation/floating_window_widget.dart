import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'floating_window_state.dart';

class FloatingWindowWidget extends ConsumerStatefulWidget {
  final FloatingWindow window;

  const FloatingWindowWidget({super.key, required this.window});

  @override
  ConsumerState<FloatingWindowWidget> createState() => _FloatingWindowWidgetState();
}

class _FloatingWindowWidgetState extends ConsumerState<FloatingWindowWidget> {
  Offset? _dragOffset;
  Offset? _resizeStart;

  @override
  Widget build(BuildContext context) {
    if (widget.window.minimized) {
      return Positioned(
        left: widget.window.x,
        bottom: 0,
        child: _buildMinimizedWindow(),
      );
    }

    return Positioned(
      left: widget.window.x,
      top: widget.window.y,
      child: GestureDetector(
        onPanStart: (details) {
          ref.read(floatingWindowsProvider.notifier).bringToFront(widget.window.id);
          _dragOffset = details.localPosition;
        },
        onPanUpdate: (details) {
          if (_dragOffset != null) {
            final newX = details.globalPosition.dx - _dragOffset!.dx;
            final newY = details.globalPosition.dy - _dragOffset!.dy;
            ref.read(floatingWindowsProvider.notifier).updatePosition(
              widget.window.id,
              newX.clamp(0, MediaQuery.of(context).size.width - widget.window.width),
              newY.clamp(0, MediaQuery.of(context).size.height - widget.window.height),
            );
          }
        },
        onPanEnd: (_) => _dragOffset = null,
        child: Material(
          elevation: widget.window.zIndex.toDouble(),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: widget.window.width,
            height: widget.window.height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                Expanded(child: widget.window.content),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.window.title,
              style: Theme.of(context).textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.minimize, size: 18),
            onPressed: () {
              ref.read(floatingWindowsProvider.notifier).toggleMinimize(widget.window.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              ref.read(floatingWindowsProvider.notifier).removeWindow(widget.window.id);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMinimizedWindow() {
    return InkWell(
      onTap: () {
        ref.read(floatingWindowsProvider.notifier).toggleMinimize(widget.window.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.window.title),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_drop_up, size: 20),
          ],
        ),
      ),
    );
  }
}
