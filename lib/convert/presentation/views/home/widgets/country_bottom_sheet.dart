  import 'package:flutter/material.dart';

void showCountryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.5,
          maxChildSize: 0.98,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    'Select Currency',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Search TextField eklendi
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search currency',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                  
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                    ),
                    
                    // onChanged: (value) { ... } // Arama fonksiyonu eklenebilir
                  ),
                  const SizedBox(height: 16),

                  // Example currency list
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (context, index) => ListTile(
                        leading: const Text('🇦🇺', style: TextStyle(fontSize: 20)),
                        title: const Text('AUD - Australian Dollar'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }