import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portal_orc/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 100,
          ),
          Text(
            'Fernande Oliveira',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Inter',
              color: kGreenOrc1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Assessore de Projetos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Inter',
              color: kGreenOrc2,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            'fernande.oliveira@orcestra.com.br',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
