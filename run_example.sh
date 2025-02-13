#!/bin/bash
if [ -z "$1" ]; then
  echo "Uso: ./run_example.sh 01_widget_criar"
  exit 1
fi

EXAMPLE_FILE="lib/examples/$1.dart"

if [ -f "$EXAMPLE_FILE" ]; then
  cp "$EXAMPLE_FILE" lib/main.dart
  flutter run
else
  echo "Erro: O arquivo $EXAMPLE_FILE não existe!"
fi
