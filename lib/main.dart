import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const AmitPortfolio());

class AmitPortfolio extends StatelessWidget {
  const AmitPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amit Kumar Singh | Portfolio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌌 Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A192F), Color(0xFF112240)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // ✨ Main Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _header(),
                    const SizedBox(height: 30),
                    _socialButtons(),
                    const SizedBox(height: 30),
                    _section(
                      title: 'About Me',
                      child: const Text(
                        "I am Amit Kumar Singh, a Flutter developer passionate about building responsive mobile apps and UI designs. "
                            "I have completed ADCA and am proficient in Flutter, Dart, MySQL, and API integration. "
                            "I am eager to apply my skills in dynamic environments that encourage innovation and growth.",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 25),
                    _skills(),
                    const SizedBox(height: 25),
                    _projects(),
                    const SizedBox(height: 25),
                    _contact(),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MultiQuizApp()),
                        );
                      },
                      child: const Text(
                        'Go to Quiz App',
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 40),
                    const Text(
                      "© 2025 Amit Kumar Singh | Built with ❤️ in Flutter",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- HEADER ----------
  Widget _header() => Column(
    children: [
      ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.cyanAccent, Colors.blueAccent],
        ).createShader(bounds),
        child: Text(
          'Amit Kumar Singh',
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 5),
      const Text(
        'Flutter Developer | ADCA Certified | Varanasi, India',
        style: TextStyle(color: Colors.cyanAccent, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      Container(
        width: 80,
        height: 3,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.cyanAccent, Colors.blueAccent],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],
  );

  // ---------- SOCIAL BUTTONS ----------
  Widget _socialButtons() => Wrap(
    spacing: 15,
    runSpacing: 10,
    alignment: WrapAlignment.center,
    children: [
      _outlinedButton('📞 Call Me', 'tel:8726633645'),
      _outlinedButton('✉️ Email',
          'mailto:amits534154@gmail.com?subject=Hello Amit&body=Hi Amit,'),
      _outlinedButton('💻 GitHub', 'https://github.com/amitsingh1131'),
      _outlinedButton('🔗 LinkedIn', 'https://linkedin.com/in/amitsingh1131'),
    ],
  );

  // ---------- OUTLINED BUTTON ----------
  Widget _outlinedButton(String label, String url) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.cyanAccent),
        foregroundColor: Colors.cyanAccent,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => _launchUrl(url),
      child: Text(label),
    ),
  );

  // ---------- REUSABLE SECTION ----------
  Widget _section({required String title, required Widget child}) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF112240),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    ),
  );

  // ---------- SKILLS ----------
  Widget _skills() {
    final skills = [
      'Flutter',
      'Dart',
      'RESTful APIs',
      'UI Design',
      'GitHub',
      'MySQL / phpMyAdmin',
      'SQLite',
      'Postman',
      'Android Studio',
      'JSON Handling',
      'Material Design',
      'Figma',
      'MS Office',
    ];

    return _section(
      title: 'Skills',
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: skills
            .map((skill) => Chip(
          elevation: 2,
          backgroundColor: Colors.cyanAccent.withOpacity(0.15),
          label: Text(skill,
              style: const TextStyle(color: Colors.cyanAccent)),
          padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        ))
            .toList(),
      ),
    );
  }

  // ---------- PROJECTS ----------
  Widget _projects() {
    final projects = [
      {
        'title': 'Quiz App (Flutter)',
        'desc':
        'Developed a dynamic and multi-category quiz application using Flutter and Dart. It fetches quizzes and questions from live JSON APIs, features an animated splash screen, and provides real-time scoring with a smooth and responsive UI.'
      },
      {
        'title': 'Portfolio App (Flutter)',
        'desc':
        'Built a responsive personal portfolio application using Flutter and Dart. It showcases my profile, skills, and projects with smooth scrolling, gradient backgrounds, and interactive navigation.'
      },
      {
        'title': 'Database Management System',
        'desc':
        'Designed a MySQL-based database using phpMyAdmin for efficient data handling and management.'
      }
    ];

    return _section(
      title: 'Projects',
      child: Column(
        children: projects
            .map((p) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF0A192F),
                Colors.cyanAccent.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.cyanAccent.withOpacity(0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p['title']!,
                  style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              const SizedBox(height: 5),
              Text(p['desc']!,
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }

  // ---------- CONTACT ----------
  Widget _contact() => _section(
    title: 'Contact Me',
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('📧 amits534154@gmail.com',
            style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        Text('📱 8726633645', style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        Text('📍 A40/35 Amarpur Madhiya, Varanasi, 221001',
            style: TextStyle(color: Colors.white70)),
      ],
    ),
  );

  // ---------- URL LAUNCHER ----------
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $urlString';
    }
  }
}

class MultiQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizListPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Text(
                  '🚀 WELCOME TO QUIZZES 🚀',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Colors.cyanAccent,
                        offset: Offset(0, 0),
                      ),
                      Shadow(
                        blurRadius: 40,
                        color: Colors.blueAccent,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class QuizListPage extends StatefulWidget {
  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  final String quizListUrl =
      'https://amitsingh1130.github.io/myjsonfiles/Quiz.json';

  List<dynamic> quizList = [];
  bool isLoading = true;
  bool errorLoading = false;

  @override
  void initState() {
    super.initState();
    fetchQuizList();
  }

  Future<void> fetchQuizList()  async {
    try {
      final response = await http.get(Uri.parse(quizListUrl));
      if (response.statusCode == 200) {
        setState(() {
          quizList = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorLoading = true;
        });
      }
    } catch (e) {
      setState(() {
        errorLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Loading Quizzes...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text(
            'Failed to load quiz list.\nCheck internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👉 Select a Quiz 🎯',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade200, Colors.indigo.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: quizList.length,
          itemBuilder: (context, index) {
            var quiz = quizList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(
                  'Quiz ${quiz['quizno']}: ${quiz['quizname']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.indigo),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        quizUrl: quiz['url'],
                        quizName: quiz['quizname'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Quiz Page
class QuizPage extends StatefulWidget {
  final String quizUrl;
  final String quizName;

  QuizPage({required this.quizUrl, required this.quizName});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<dynamic> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;
  String feedback = '';
  bool isLoading = true;
  bool errorLoading = false;

  @override
  void initState() {
    super.initState();
    fetchQuiz();
  }

  Future<void> fetchQuiz() async {
    try {
      final response = await http.get(Uri.parse(widget.quizUrl));
      if (response.statusCode == 200) {
        setState(() {
          questions = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorLoading = true;
        });
      }
    } catch (e) {
      setState(() {
        errorLoading = true;
      });
    }
  }

  void checkAnswer(int selectedOption) {
    String correct = questions[currentQuestionIndex]['correctanswer'];
    setState(() {
      if (selectedOption.toString() == correct) {
        score++;
        feedback = "✅ Correct!";
      } else {
        feedback = "❌ Wrong!";
      }

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          feedback = '';
          if (currentQuestionIndex < questions.length - 1) {
            currentQuestionIndex++;
          } else {
            quizCompleted = true;
          }
        });
      });
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      quizCompleted = false;
      feedback = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Loading ${widget.quizName}...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text(
            'Failed to load quiz.\nCheck internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    if (quizCompleted) {
      return Scaffold(
        appBar: AppBar(title: Text('${widget.quizName} Completed')),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade200, Colors.indigo.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score: $score / ${questions.length}',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: resetQuiz,
                child: Text('🔄 Restart Quiz',
                    style:
                    TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('⬅️ Back to List',
                    style:
                    TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AmitPortfolio()),
                ),
                child: Text('⬅️ Back to AmitPortfolio',
                    style:
                    TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    }

    var question = questions[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(title: Text(widget.quizName)),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.indigo.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.indigo,
              minHeight: 8,
            ),
            SizedBox(height: 20),
            Text(
              'Q${question['qno']}: ${question['question']}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 40),
            QuizOptionButton(
              text: question['opa'],
              onPressed: () => checkAnswer(1),
            ),
            QuizOptionButton(
              text: question['opb'],
              onPressed: () => checkAnswer(2),
            ),
            QuizOptionButton(
              text: question['opc'],
              onPressed: () => checkAnswer(3),
            ),
            QuizOptionButton(
              text: question['opd'],
              onPressed: () => checkAnswer(4),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                feedback,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  QuizOptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
