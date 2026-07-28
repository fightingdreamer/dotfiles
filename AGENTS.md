# Coding Agent Instructions

## Shared Workspace

- Treat the workspace as shared with the user.
- When a file changes unexpectedly, inspect it and determine whether the change came from the agent or the user before proceeding.
- Do not wipe, overwrite wholesale, or use Git recovery or reset operations without first explaining their impact and receiving the user's explicit approval.
- Preserve user changes and work around them unless the user explicitly asks otherwise.

## Design Approval

- Before changing code, ask the user how they want the specific problem solved.
- Propose a concise list of viable solution options.
- Explain the key tradeoffs, risks, and affected areas for each option.
- Recommend an option when appropriate, while leaving the decision to the user.
- Do not write, edit, or generate implementation code until the user explicitly approves the architecture or design.

## Implementation Style

- Keep proposed solutions easy to reason about and avoid unnecessary mental load.
- Do not add docstrings; use self-explanatory function and class names instead.
- Prefer forward-only control flow with minimal mutation and side effects.
- Keep control flow flat by using early returns, throws, `continue`, `break`, or extracted steps instead of nesting `if`, `for`, and `while` blocks.
- In typed languages, prefer interfaces and immutable (`const`) function inputs when supported.
- Prefer existing project solutions for a given task unless reusing them would increase mental load.
- Apply DRY only when deduplication is straightforward and reduces complexity; do not fragment code into tiny helpers that increase mental load.
- Optimize for a working draft before cleanup and polish.
- Do not spend implementation time removing unused imports or addressing lint and type-checking errors unless they block the work.
- Use one statement per line and one condition per line so a debugger breakpoint can isolate each step.

## Problematic Code

- Do not force an unclean implementation when the problem cannot be solved safely or maintainably as-is.
- Propose the smallest change that solves the problem cleanly.
- When related code is in a poor state, report the specific issue to the user before implementation.
- Propose a focused refactor, legacy-code cleanup, or technical-debt reduction as preparation for the intended change.
- Wait for approval of that preparatory work before implementing it.

## User Decisions

- Treat the user as the final decision-maker.
- When requirements are ambiguous, explain the ambiguity and ask focused clarifying questions before proceeding.
- When multiple valid approaches exist, explain the relevant differences, propose options, and ask the user to choose.
- Do not make product, architecture, or behavior decisions on the user's behalf.

## Problem Solving

- Focus on one problem at a time.
- Split complex problems into smaller problems that can be reasoned about and validated independently.
- Validate reasoning with concrete examples or small experiments when useful, preferably in numbered local files.
- Return to the user with the proposed investigation plan and wait for validation before starting problem-solving work.
- Ask the user for clarification or additional information whenever the plan has material gaps.
- Before trying a fundamentally different approach, ensure the current work state is clean or explicitly preserved and accounted for.

## Incremental Delivery

- Work in small, independently reviewable and preferably verifiable steps.
- Prefer introducing and validating a new solution before switching the main logic to use it.
- When refactoring, first create correctly typed scaffolding with intentionally empty implementation where practical.
- Update dependencies to use that scaffolding and ask the user to validate the dependency chain before adding behavior.
- Separate structural and dependency changes from implementation changes to reduce review and validation mental load.

## Testing And Validation

- Start testing with the smallest happy-path test.
- After it passes, measure coverage for the new solution and decide which focused cases to add next.
- Allow duplicated test code, mocks, and patches when it keeps tests separate and clear; consolidate only non-trivial repetition when doing so is plainly simpler.
- Keep assertions explicit in each test and do not move them to shared helpers.
- Investigate and resolve ordinary test failures without reporting each failure to the user.
- Ask the user for help with database, environment, credential, external-service, or other contextual issues the user may know more about.
- Do not spend time fixing known test failures while a new solution is intentionally incomplete or has not yet been migrated from legacy behavior.
- Clearly distinguish known transitional failures from unexpected failures.
- Before changing tests, inspect relevant existing tests for edge cases whose expected behavior may differ under the new logic.
- Present those gaps and behavioral questions to the user when the correct expectation is unclear.
- After the solution and migration are complete, run the full relevant test suite and measure coverage, including branch coverage where supported.
- Measure and aim for near-complete coverage of the new solution only, including its branching paths.

## Python

- Run Python through `uv run python`.
- Run Alembic with an explicit configuration path using `alembic --config <path> <command>`.

- For cache/memoize methods, use a single late return. Prefer the one-line
  form when the compute call fits on one line:

  ```python
  try:
      result = self._cache[key]
  except KeyError:
      result = self._cache[key] = compute()
  return result
  ```

  When the compute call is complex or spans multiple lines, split into
  separate statements so a breakpoint can isolate each step:

  ```python
  try:
      result = self._cache[key]
  except KeyError:
      result = compute()
      self._cache[key] = result
  return result
  ```

## Commits

- Before committing, ask the user to review and explicitly approve the changes.
- Write concise commit messages as normal sentences.
- Do not use Conventional Commit prefixes by default.
