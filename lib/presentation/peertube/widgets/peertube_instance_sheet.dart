import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/peertube/peertube_bloc.dart';
import 'package:vyplay/core/constants.dart';

/// Add, remove and switch PeerTube instances.
///
/// Validation happens through `GET /api/v1/config`, so an arbitrary URL is
/// never stored as a working PeerTube source.
Future<void> showPeerTubeInstanceSheet(BuildContext context) {
  final bloc = context.read<PeerTubeBloc>();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (sheetContext) => BlocProvider.value(
      value: bloc,
      child: const _PeerTubeInstanceSheet(),
    ),
  );
}

class _PeerTubeInstanceSheet extends StatefulWidget {
  const _PeerTubeInstanceSheet();

  @override
  State<_PeerTubeInstanceSheet> createState() => _PeerTubeInstanceSheetState();
}

class _PeerTubeInstanceSheetState extends State<_PeerTubeInstanceSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _add() {
    FocusScope.of(context).unfocus();
    final url = _controller.text.trim();
    if (url.isEmpty) return;
    context.read<PeerTubeBloc>().add(PeerTubeAddInstance(url));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: BlocBuilder<PeerTubeBloc, PeerTubeState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.dns_outlined),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'PeerTube instances',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Any public PeerTube server can be added. Browsing does not '
                'need an account.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              kHeightBox12,
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 260),
                child: state.instances.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'No instances yet. Add one below.',
                          style: theme.textTheme.bodySmall,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.instances.length,
                        itemBuilder: (context, index) {
                          final instance = state.instances[index];
                          final selected = instance.url == state.activeUrl;
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            leading: Icon(
                              selected
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: selected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                            title: Text(instance.name),
                            subtitle: Text(
                              instance.url,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              context
                                  .read<PeerTubeBloc>()
                                  .add(PeerTubeSelectInstance(instance.url));
                              Navigator.of(context).pop();
                            },
                            trailing: IconButton(
                              tooltip: 'Remove',
                              icon: const Icon(Icons.delete_outline, size: 20),
                              onPressed: () => context
                                  .read<PeerTubeBloc>()
                                  .add(PeerTubeRemoveInstance(instance.url)),
                            ),
                          );
                        },
                      ),
              ),
              const Divider(height: 24),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                enabled: !state.addingInstance,
                onSubmitted: (_) => _add(),
                decoration: const InputDecoration(
                  labelText: 'Instance URL',
                  hintText: 'https://framatube.org',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.language, size: 20),
                ),
              ),
              if (state.addingInstance) ...[
                kHeightBox8,
                const LinearProgressIndicator(),
              ],
              if (state.error != null) ...[
                kHeightBox8,
                Text(
                  state.error!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              kHeightBox8,
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: state.addingInstance ? null : _add,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Validate & add'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
