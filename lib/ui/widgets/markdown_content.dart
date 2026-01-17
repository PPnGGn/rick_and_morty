import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

/// Виджет для отображения Markdown контента с очисткой от ссылок на цитаты
class MarkdownContent extends StatelessWidget {
  final String data;
  final bool isStreaming;

  const MarkdownContent({
    super.key,
    required this.data,
    this.isStreaming = false,
  });

  @override
  Widget build(BuildContext context) {
    final cleanedData = _cleanMarkdown(data);
    
    return MarkdownBody(
      data: cleanedData,
      styleSheet: _getStyleSheet(context),
      shrinkWrap: true,
      selectable: true,
      onTapLink: (text, href, title) {
        if (href != null) {
          debugPrint('Markdown link tapped: $href');
        }
      },
    );
  }

  /// Очищает Markdown от ссылок на цитаты типа [1][2]
  String _cleanMarkdown(String text) {
    // Удаляем ссылки на цитаты в формате [число]
    final cleaned = text.replaceAll(RegExp(r'\[\d+\]'), '');
    
    // Удаляем определения ссылок в формате [число]: URL
    final withoutDefinitions = cleaned.replaceAll(
      RegExp(r'^\[\d+\]:\s*.*$', multiLine: true), 
      ''
    );
    
    // Удаляем лишние пустые строки
    return withoutDefinitions
        .replaceAll(RegExp(r'\n\s*\n\s*\n'), '\n\n')
        .trim();
  }

  MarkdownStyleSheet _getStyleSheet(BuildContext context) {
    final theme = Theme.of(context);
    return MarkdownStyleSheet(
      // Базовые стили
      p: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        height: 1.5,
        color: theme.colorScheme.onSurface,
      ),
      
      // Заголовки
      h1: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
      h2: theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
      h3: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.primary,
      ),
      
      // Списки
      listBullet: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        height: 1.5,
        color: theme.colorScheme.onSurface,
      ),
      
      // Код
      code: theme.textTheme.bodyMedium?.copyWith(
        fontFamily: 'monospace',
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      codeblockDecoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      codeblockPadding: const EdgeInsets.all(12),
      
      // Цитаты
      blockquote: theme.textTheme.bodyMedium?.copyWith(
        fontStyle: FontStyle.italic,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.colorScheme.primary,
            width: 4,
          ),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
      ),
      
      // Ссылки
      a: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      
      // Жирный и курсивный текст
      strong: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
      em: theme.textTheme.bodyLarge?.copyWith(
        fontStyle: FontStyle.italic,
        color: theme.colorScheme.onSurface,
      ),
      
      // Горизонтальные линии
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
    );
  }
}
