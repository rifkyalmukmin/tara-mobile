import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Layar "TaniBot Chatbot": percakapan dengan asisten AI TaniBot.
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.time,
    required this.fromUser,
    this.actionCard = false,
  });

  final String text;
  final String time;
  final bool fromUser;

  /// true = bubble bot memuat kartu ajakan "Coba Fitur Deteksi".
  final bool actionCard;
}

class _ChatScreenState extends State<ChatScreen> {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();

  // Percakapan awal sesuai desain.
  List<_ChatMessage> _messages = const [
    _ChatMessage(
      text: 'Halo! Kondisi tanah di Wadah A saat ini sangat baik. '
          'Berdasarkan data cuaca, diperkirakan akan hujan sore ini. '
          'Ada yang bisa saya bantu terkait perawatan tanaman '
          'Anda hari ini?',
      time: '10:00',
      fromUser: false,
    ),
    _ChatMessage(
      text: 'Daun tomat saya mulai menguning di bagian bawah, kenapa ya?',
      time: '10:05',
      fromUser: true,
    ),
    _ChatMessage(
      text: 'Mengingat kelembapan akhir-akhir ini cukup tinggi (72%), '
          'daun menguning di bagian bawah bisa jadi tanda awal '
          'kekurangan Nitrogen atau kemungkinan infeksi jamur ringan.',
      time: '10:06',
      fromUser: false,
      actionCard: true,
    ),
  ];

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages = List.of(_messages)
        ..add(
          _ChatMessage(
            text: text,
            time: TimeOfDay.now().format(context),
            fromUser: true,
          ),
        );
      _inputController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
    // TODO: hubungkan ke backend TaniBot untuk balasan otomatis.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            children: [
              const _ContextCard(),
              const SizedBox(height: 16),
              for (final message in _messages) ...[
                _MessageBubble(message: message),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        _InputBar(
          controller: _inputController,
          onSend: _sendMessage,
        ),
      ],
    );
  }
}

class _ContextCard extends StatelessWidget {
  const _ContextCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.wifi_tethering,
                size: 16,
                color: AppColors.darkGreen,
              ),
              SizedBox(width: 6),
              Text(
                'Kondisi Saat Ini (Wadah A)',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _ContextChip(label: 'pH: 6.5 (Optimal)'),
              _ContextChip(label: 'Kelembapan: 72%'),
              _ContextChip(label: 'Suhu: 28°C'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContextChip extends StatelessWidget {
  const _ContextChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F3),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11.5,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final _ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: const BoxConstraints(maxWidth: 260),
      decoration: BoxDecoration(
        color: message.fromUser ? AppColors.darkGreen : AppColors.treatmentBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: message.fromUser ? Colors.white : AppColors.textPrimary,
            ),
          ),
          if (message.actionCard) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Icon(
                      Icons.center_focus_weak,
                      size: 15,
                      color: AppColors.darkGreen,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Coba Fitur Deteksi',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGreen,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Ambil foto daun yang menguning agar saya bisa '
                          'menganalisisnya lebih akurat.',
                          style: TextStyle(
                            fontSize: 11.5,
                            height: 1.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );

    final avatar = Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: AppColors.brandGreen,
        shape: BoxShape.circle,
      ),
      child: message.fromUser
          ? const Icon(Icons.person, size: 14, color: Colors.white)
          : const Icon(Icons.smart_toy, size: 13, color: Colors.white),
    );

    return Column(
      crossAxisAlignment: message.fromUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.fromUser) ...[avatar, const SizedBox(width: 8)],
            bubble,
            if (message.fromUser) ...[const SizedBox(width: 8), avatar],
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.only(left: message.fromUser ? 0 : 32),
          child: Text(
            message.time,
            style: const TextStyle(
              fontSize: 10.5,
              color: AppColors.textTertiary,
            ),
          ),
        ),
      ],
    );
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.image_outlined,
            size: 22,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => onSend(),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
              decoration: const InputDecoration.collapsed(
                hintText: 'Ketik pesan atau tanya TaniBot...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
