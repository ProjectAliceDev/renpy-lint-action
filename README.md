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
or to reuse a previously cached download of the sdk utilizing the [GitHub Cache Action](https://github.com/marketplace/actions/cache)
```yml
- name: Get SDK Version from config
  id: lookupSdkVersion
  uses: devorbitus/yq-action-output@v1.0
  with:
    # The file path would be to wherever this file is located
    cmd: yq eval '.jobs.build.steps[] | select(.id == "lintProject") | .with.sdk-version' .github/workflows/renpy-linter-action.yml
- name: Restore Cache
  id: restore-cache
  uses: actions/cache@v2
  with:
    path: ../renpy
    key: ${{ runner.os }}-sdk-${{ steps.lookupSdkVersion.outputs.result }}
- name: Lint VN project
  id: lintProject
  uses: ProjectAliceDev/renpy-lint-action@master
  with:
    sdk-version: '6.99.12.4'
    project-dir: '.'
  env:
    SDL_AUDIODRIVER: dummy
    SDL_VIDEODRIVER: dummy
- name: Cache SDK
  id: save-cache
  if: steps.restore-cache.outputs.cache-hit != 'true'
  uses: actions/cache@v2
  with:
    path: ../renpy
    key: ${{ runner.os }}-sdk-${{ steps.lookupSdkVersion.outputs.result }}
```

**Required Parameters:**

- `sdk-version`: The version of the Ren'Py SDK to use while linting. Will default to `7.3.2` if none is found.
- `project-dir`: The directory where the project exists. Will default to `'.'` (root) if none is found.

> :warning: If you are targeting Ren'Py v7.4.0+, you **must** use v1.1.1 of this action or greater.
