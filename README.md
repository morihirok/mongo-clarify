# mongo-clarify
WARNING: This program is under construction.

## What is this?

MongoDB explain is a little hard to read because it is JSON.

This program makes it possible to convert MongoDB explain into Markdown table format. As below.

| | |
| ---- | ---- |
| Means of Operation  | Index Scan (Index Name: price_1) |
| nReturned           | 1 |
| executionTimeMillis | 13 msec |
| totalKeysExamined   | 1 |
| totalDocsExamined   | 1 |
