# myezhr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## JSON Serialization generator

Use this website "https://app.quicktype.io/" to convert json string to dart class object. 

Each json key need to be annotate because key name format is using snake case.

After successfully generate new class object for json model, run the below command to generate your class json serializer

- flutter pub run build_runner build --delete-conflicting-outputs
