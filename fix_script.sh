#!/bin/bash

# Fix common Flutter issues across the codebase
cd "/workspace/My Projects/BeThriftyToday"

# Replace deprecated @required with required keyword
find lib -name "*.dart" -type f -exec sed -i 's/@required //g' {} \;

# Replace accentColor with colorScheme.secondary
find lib -name "*.dart" -type f -exec sed -i 's/Theme\.of(context)\.accentColor/Theme.of(context).colorScheme.secondary/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/theme\.accentColor/theme.colorScheme.secondary/g' {} \;

# Replace FlatButton with TextButton
find lib -name "*.dart" -type f -exec sed -i 's/FlatButton(/TextButton(/g' {} \;

# Replace package:share/share.dart with package:share_plus/share_plus.dart
find lib -name "*.dart" -type f -exec sed -i "s|package:share/share.dart|package:share_plus/share_plus.dart|g" {} \;
find lib -name "*.dart" -type f -exec sed -i 's/Share\.share/Share.share/g' {} \;

# Add late keyword to uninitialized non-nullable fields
# This is more complex and needs manual intervention

echo "Basic fixes applied"
