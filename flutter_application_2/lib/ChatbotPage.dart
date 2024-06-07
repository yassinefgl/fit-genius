import 'package:flutter/material.dart';
class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    _botResponse(text);
  }

  void _botResponse(String userQuery) {
    Map<String, String> predefinedResponses = {
      "Salut": "Salut ! Comment puis-je vous aider ?",
      "Quel temps fait-il ?":
          "Il fait beau aujourd'hui. Profitez-en !",
      "Au revoir": "Au revoir ! À bientôt.",
      "Autre question": "Désolé, je ne suis qu'un exemple basique de chatbot.",
      "Conseils pour diabète": "Voici quelques conseils pour les personnes diabétiques :\n\n"
          "- Maintenez une alimentation équilibrée et faites de l'exercice régulièrement.\n\n"
          "- Surveillez régulièrement votre glycémie et consultez votre médecin.\n\n"
          "- Évitez les aliments riches en sucre ajouté et les graisses saturées.\n\n"
          "- Limitez votre consommation d'alcool et de tabac.",
      "Symptômes du diabète": "Les symptômes courants du diabète comprennent :\n\n"
          "- Soif et faim fréquentes\n\n"
          "- Besoin fréquent d'uriner\n\n"
          "- Fatigue\n\n"
          "- Vision floue\n\n"
          "- Cicatrisation lente des plaies\n\n"
          "Si vous avez ces symptômes, consultez un professionnel de santé.",
      "Comment contrôler glycémie ?": "Pour contrôler votre glycémie, vous pouvez faire ce qui suit :\n\n"
          "- Suivez un régime alimentaire équilibré et faites de l'exercice régulièrement.\n\n"
          "- Prenez vos médicaments selon les instructions de votre médecin.\n\n"
          "- Surveillez régulièrement votre glycémie à l'aide d'un glucomètre.\n\n"
          "- Consultez régulièrement votre médecin pour un suivi.",
      "Aliments pour diabète": "Voici quelques aliments recommandés pour les personnes diabétiques :\n\n"
          "- Légumes non féculents comme les épinards, les carottes et les brocolis.\n\n"
          "- Fruits frais à faible teneur en sucre comme les baies, les pommes et les agrumes.\n\n"
          "- Protéines maigres comme le poulet, le poisson et les haricots.\n\n"
          "- Grains entiers comme l'avoine, le riz brun et le quinoa.\n\n"
          "- Produits laitiers faibles en matières grasses comme le yaourt et le lait.\n\n"
          "Assurez-vous de surveiller les portions et de consulter un nutritionniste si nécessaire.",
      "Exercices pour diabète": "Voici quelques exercices recommandés pour les personnes diabétiques :\n\n"
          "- Marche rapide ou randonnée.\n\n"
          "- Natation ou aquagym.\n\n"
          "- Vélo ou vélo elliptique.\n\n"
          "- Yoga ou tai-chi pour la flexibilité et la relaxation.\n\n"
          "- Musculation légère pour renforcer les muscles.\n\n"
          "Consultez votre médecin avant de commencer un nouveau programme d'exercice.",
    };

    String response = predefinedResponses[userQuery] ?? "Désolé, je ne comprends pas.";
    ChatMessage botMessage = ChatMessage(
      text: response,
      isUserMessage: false,
    );
    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coach IA'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children:<Widget>[
                _buildMessageInput(),
                SizedBox(height: 8.0),
                _buildPredefinedQuestionsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Envoyer un message...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () => _handleSubmitted(_textController.text),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPredefinedQuestionsButton() {
    return ElevatedButton(
      onPressed: _showPredefinedQuestions,
      child: Text('Questions prédéfinies'),
    );
  }

void _showPredefinedQuestions() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Questions prédéfinies"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPredefinedQuestionButton("Salut"),
            _buildPredefinedQuestionButton("Quel temps fait-il ?"),
            _buildPredefinedQuestionButton("Au revoir"),
            _buildPredefinedQuestionButton("Conseils pour diabète"),
            _buildPredefinedQuestionButton("Symptômes du diabète"),
            _buildPredefinedQuestionButton("Comment contrôler glycémie ?"),
            _buildPredefinedQuestionButton("Aliments pour diabète"),
            _buildPredefinedQuestionButton("Exercices pour diabète"),
          ],
        ),
      );
    },
  );
}

Widget _buildPredefinedQuestionButton(String question) {
  return TextButton(
    onPressed: () {
      Navigator.of(context).pop(); // Ferme la boîte de dialogue
      _handleSubmitted(question); // Envoyer la question sélectionnée au chatbot
    },
    child: Text(question),
  );
}

}
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: isUserMessage ? Theme.of(context).primaryColor : Color(0xFF64B5F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isUserMessage ? 10.0 : 0),
                topRight: Radius.circular(isUserMessage ? 0 : 10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

