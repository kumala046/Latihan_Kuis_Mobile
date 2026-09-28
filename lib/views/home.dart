import 'package:flutter/material.dart';
import 'package:latkuis/models/animals_data.dart';
import 'package:latkuis/views/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: dummyAnimals.length,
      itemBuilder: (context, index) {
        final animal = dummyAnimals[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(animal: animal),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      animal.image,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 90),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Tipe: ${animal.type}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Habitat: ${animal.habitat.join(', ')}",
                          style: const TextStyle(color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF2E7D32),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}