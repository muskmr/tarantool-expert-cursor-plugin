import * as assert from 'assert';
import * as vscode from 'vscode';

suite('Hello Cursor Extension Test Suite', () => {
  suiteSetup(async () => {
    const ext = vscode.extensions.getExtension('your-publisher.hello-cursor');
    assert.ok(ext, 'Expected the extension to be present');
    await ext.activate();
  });

  test('Command is registered', async () => {
    const commands = await vscode.commands.getCommands(true);
    assert.ok(
      commands.includes('hello-cursor.helloWorld'),
      'Expected hello-cursor.helloWorld command to be registered',
    );
  });

  test('Command executes without throwing', async () => {
    await vscode.commands.executeCommand('hello-cursor.helloWorld');
  });
});
