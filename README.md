# DSA Practice

Daily Data Structures & Algorithms practice — one problem per day.

## Folder Structure

```
dsa-practice/
├── topics/                   # Problems organized by DSA topic
│   ├── arrays/
│   ├── strings/
│   ├── linked-lists/
│   ├── stacks-and-queues/
│   ├── trees/
│   ├── binary-search-trees/
│   ├── graphs/
│   ├── dynamic-programming/
│   ├── binary-search/
│   ├── hashing/
│   ├── two-pointers/
│   ├── sliding-window/
│   ├── recursion-and-backtracking/
│   ├── sorting-and-searching/
│   ├── greedy/
│   ├── heaps-and-priority-queues/
│   ├── math-and-bit-manipulation/
│   └── tries/
├── templates/                # Starter files for each language
├── progress/                 # Daily progress log
└── scripts/                  # Helper scripts
```

Each problem lives in its own subfolder:
```
topics/<topic>/<problem-slug>/
├── README.md        ← problem info, approach, complexity
├── solution.py
├── Solution.java
├── solution.cpp
└── solution.js
```

## Progress

See [progress/log.md](progress/log.md) for the full daily log.

## Topic Summary

| Topic | Problems Solved |
|-------|:--------------:|
| Arrays | 0 |
| Strings | 0 |
| Linked Lists | 0 |
| Stacks & Queues | 0 |
| Trees | 0 |
| Binary Search Trees | 0 |
| Graphs | 0 |
| Dynamic Programming | 0 |
| Binary Search | 0 |
| Hashing | 0 |
| Two Pointers | 0 |
| Sliding Window | 0 |
| Recursion & Backtracking | 0 |
| Sorting & Searching | 0 |
| Greedy | 0 |
| Heaps & Priority Queues | 0 |
| Math & Bit Manipulation | 0 |
| Tries | 0 |

> Update counts manually after adding new solutions.

## How to Add a New Problem

```powershell
# Using the helper script
.\scripts\new-problem.ps1 -Topic arrays -Slug two-sum
```

Or manually:
1. Create a folder: `topics/<topic>/<problem-slug>/`
2. Copy templates from `templates/` into the problem folder
3. Fill in `README.md` with problem info and your approach
4. Solve the problem in your preferred language(s)
5. Commit with a clear message:
   ```
   git add .
   git commit -m "Day XX: Two Sum (LeetCode #1) [Easy]"
   ```

## Languages

- Python 3
- Java
- C++
- JavaScript / TypeScript

## Platforms

- [LeetCode](https://leetcode.com)
- [HackerRank](https://www.hackerrank.com)
- Mixed / Other
