// використання паттерну Command

// паттерн Command, який дозволяє ізолювати запити від їхніх отримувачів та
// передавати їх як об'єкти, що дозволяє зберігати історію запитів, відміну
// запитів та підтримувати відміну/повторення дій.
// команди TurnOnCommand та TurnOffCommand для включення та вимикання світла.
// Клас RemoteControl є інвокером, що передає команду відправнику, який
// виконує відповідну дію.

// створюємо інтерфейс
abstract class Command {
  void execute();
}

// Приймач
class Light {
  void turnOn() {
    print('Light turned on');
  }

  void turnOff() {
    print('Light turned off');
  }
}

// конкретна реалізація команда ON
class TurnOnCommand implements Command {
  final Light _light;

  TurnOnCommand(this._light);

  @override
  void execute() {
    _light.turnOn();
  }
}

// конкретна реалізація команда OFF
class TurnOffCommand implements Command {
  final Light _light;

  TurnOffCommand(this._light);

  @override
  void execute() {
    _light.turnOff();
  }
}

// Invoker class
class RemoteControl {
  late Command _command;

  void setCommand(Command command) {
    _command = command;
  }

  void pressButton() {
    _command.execute();
  }
}

void main() {
  // створюємо приймач команд
  final light = Light();

  // Створення конкретних командних об'єктів
  final turnOnCommand = TurnOnCommand(light);
  final turnOffCommand = TurnOffCommand(light);

  // Create invoker
  final remoteControl = RemoteControl();

  // Задати команду для виклику
  remoteControl.setCommand(turnOnCommand);

  // Press button
  remoteControl.pressButton(); // Output: Light turned on

  // Встановіть іншу команду для виклику
  remoteControl.setCommand(turnOffCommand);

  // Press button again
  remoteControl.pressButton(); // Output: Light turned off
}
