![image](https://github.com/user-attachments/assets/fb8ec28c-2d0f-4740-8dff-7d6f6ab618fd)

<h1 align="center">
   <b>
     
 Teste Técnico Guia de Motéis
   </b>
</h1>

Olá, bem vindo ao meu teste!

Este aplicativo tem como objetivo ajudar os usuários a encontrarem motéis de forma rápida e eficiente, oferecendo informações sobre localização, preços e avaliações. Neste projeto você irá explorar funcionalidades da tela principal do app.

# Gerenciador de Estado
Guia de Motéis utiliza [ChangeNotifier](https://docs.flutter.dev/data-and-backend/state-mgmt/simple) como gerenciador de estado, sendo uma solução leve e rápida para Flutter, que permite criar um projeto organizado e com código limpo de forma nativa sem depender de nenhum package.

![WhatsApp Video 2025-02-12 at 08 49 20_8d8d36e0](https://github.com/user-attachments/assets/c161fe62-a5be-4749-a7fd-cdca628452ef)

# Carrossel
O app ultiliza o package [carousel_slider](https://pub.dev/packages/carousel_slider) para criar todos os widgets de carrosséis de forma simples e personalizável para cada item.

![WhatsApp Video 2025-02-12 at 08 43 49_a0005f37](https://github.com/user-attachments/assets/180ec373-1faa-4adc-8758-9fdde2426575)

# Requisições Http
O app ultiliza o package [http](https://pub.dev/packages/http) para realizar todas as requisições de forma simples e rápida, contendo várias funções de alto-nivel que são mantidas pela própria equipe do [dart.dev](https://dart.dev/).


# Como Rodar o Projeto

É necessário ter [Flutter](https://flutter.dev/) e [Android Studio](https://developer.android.com/studio?hl=pt-br) instalados e configurados corretamente.

1 - Clonar o repositório.
```shell
git clone https://github.com/jpDEVsekiro/teste-guia-de-moteis.git
```

2 - Abrir o projeto no Android Studio.

3 - Rodar `flutter pub get` no terminal.
```shell
flutter pub get
```

4 - Rodar o projeto.
```shell
flutter run
```

# Como Rodar os Testes

Para rodar os testes unitários é necessário rodar o comando `flutter test` no terminal.
```shell
flutter test
```

Para rodar os testes de integração é necessário rodar o comando `flutter test integration_test/all_integration_test.dart` no terminal.
```shell
flutter test integration_test/all_integration_test.dart
```
