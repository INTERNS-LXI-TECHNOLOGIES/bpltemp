import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agent Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const CoursesWidget(),
      debugShowCheckedModeBanner: false,
      );
    }
  }


class CoursesWidget extends StatefulWidget {
  const CoursesWidget({super.key});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



void _showCreateAgentTypeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Create New Agent'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Agent ID',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle ID input
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Agent Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle name input
                },
              ),
               const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Organisation Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle name input
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle description input
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle create agent logic here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Agent created successfully')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      );
    },
  );
}

void _showCreateOrganizationDialog(BuildContext context) {
  _nameController.clear();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Create New Organization'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Only Name Field for Organization
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Organization Name*',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
             onPressed: () {
              // Handle create agent logic here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Organization created successfully')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      );
    },
  );
}



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Row(
          children: [
            // Sidebar
            Container(
              width: 80,
              color: Colors.grey[200],
              child: const Column(
                children: [
                  // Add your sidebar items here
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Mobile header (hidden on desktop)
                    if (MediaQuery.of(context).size.width < 1024)
                      Container(
                        width: double.infinity,
                        height: 44,
                        color: Colors.white,
                      ),
                    
                    // Main content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header section
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: Colors.grey[300]!,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Your Agents & Organization',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Below you will find a summary of your agents & organization.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(Icons.language, size: 15),
                                      label: const Text('Language'),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(150, 40),
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        elevation: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            // Cards section
                            SizedBox(
                              height: 240,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                children: [
                                  _buildCard(
                                    context,
                                    title: 'Create Agent Type',
                                    subtitle: '12 Agent Types',
                                    progress: 0.3,
                                    progressColor: Colors.purple,
                                    backgroundColor: Colors.purple,
                                  ),
                                  _buildCard(
                                    context,
                                    title: 'Create Organization',
                                    subtitle: '12 Organization',
                                    progress: 0.75,
                                    progressColor: Colors.blue,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            
                            // Table section
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: _TableHeader(),
                                    ),
                                    _TableContent(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildCard(
  BuildContext context, {
  required String title,
  required String subtitle,
  required double progress,
  required Color progressColor,
  required Color backgroundColor,
}) {
  return SizedBox(
    width: 270,
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            // Top colored section (unchanged)
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [





                   Container(
  width: 36,
  height: 36,
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.6),
    borderRadius: BorderRadius.circular(12),
  ),
  alignment: Alignment.center,
  child: IconButton(
    icon: const Icon(
      Icons.add,
      color: Colors.white,
      size: 20,
    ),
    padding: EdgeInsets.zero,
    onPressed: () {
      if (title == 'Create Agent Type') {
        _showCreateAgentTypeDialog(context);
      } else if (title == 'Create Organization') {
        _showCreateOrganizationDialog(context);
      }
    },
  ),
),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom section - FIXED VERSION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 244, // Matches progress bar width
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // User avatars
                        SizedBox(
                          width: 120, // Reduced width
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12, // Slightly smaller
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                ),
                              ),
                              const SizedBox(width: 4), // Reduced spacing
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                ),
                              ),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1598346762291-aee88549193f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Worker count
                        Flexible(
                          child: Text(
                            progress == 0.3 ? '21 workers' : '16 workers',
                            style: const TextStyle(
                              fontSize: 12, // Smaller font
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Progress bar
                  LinearPercentIndicator(
                    percent: progress,
                    width: 244,
                    lineHeight: 16,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: progressColor,
                    backgroundColor: Colors.grey[200],
                    barRadius: const Radius.circular(12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Text(
              'ID',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          if (MediaQuery.of(context).size.width >= 768)
            const Expanded(
              flex: 2,
              child: Text(
                'NAME',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          if (MediaQuery.of(context).size.width >= 576)
            const Expanded(
              child: Text(
                'DESCRIPTION',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          if (MediaQuery.of(context).size.width >= 768)
            const Expanded(
              child: Text(
                'Date Created',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(
                'edit | Delete | Look',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableContent extends StatelessWidget {
  final List<Map<String, dynamic>> agents = [
    {
      'id': '1',
      'name': 'Scanning Agent',
      'description': 'Design & Education',
      'date': '2 days ago',
    },
    {
      'id': '2',
      'name': 'Delivery Agent',
      'description': 'Design & Education',
      'date': '3 days ago',
    },
    {
      'id': '3',
      'name': 'Clearence Agent',
      'description': 'Design & Education',
      'date': '1 week ago',
    },
    {
      'id': '4',
      'name': 'Carrier Agent',
      'description': 'Development & No Code',
      'date': '2 weeks ago',
    },
    {
      'id': '5',
      'name': 'Delivery Agent',
      'description': 'Development & No Code',
      'date': '1 month ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: agents.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Colors.grey[300],
      ),
      itemBuilder: (context, index) {
        final agent = agents[index];
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            agent['id'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (MediaQuery.of(context).size.width < 768)
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                agent['description'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width >= 768)
                  Expanded(
                    flex: 2,
                    child: Text(
                      agent['name'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                if (MediaQuery.of(context).size.width >= 576)
                  Expanded(
                    child: Text(
                      agent['name'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                if (MediaQuery.of(context).size.width >= 768)
                  Expanded(
                    child: Text(
                      agent['date'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (MediaQuery.of(context).size.width < 768)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            agent['date'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_document, size: 24),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined, size: 24),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.list, size: 24),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
