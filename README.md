# Lint Ren'Py Project

This GitHub action allows you to run the linter on a Ren'Py visual novel project in a workflow for testing purposes.

## Usage

```yml
- name: Lint VN project
  uses: ProjectAliceDev/renpy-lint-action@master
  with:
    sdk-version: '6.99.12.4'
    project-dir: '.'
  env:
    SDL_AUDIODRIVER: dummy
    SDL_VIDEODRIVER: dummy
```

**Required Parameters:**

- `sdk-version`: The version of the Ren'Py SDK to use while linting. Will default to `7.3.2` if none is found.
- `project-dir`: The directory where the project exists. Will default to `'.'` (root) if none is found.

> :warning: If you are targeting Ren'Py v7.4.0+, you **must** use v1.1.1 of this action or greater.
