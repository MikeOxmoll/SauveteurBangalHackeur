<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sauveteurs du Dunkerquois | Bangal'Hackeurs</title>
    <!-- BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- SWIPER CSS -->
    <link rel="stylesheet" href="./vue/styles/styleCSS/swiper-bundle.min.css">
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="./vue/styles/styleCSS/style.css">
</head>
<body>
    <!-- HEADER -->

    <header class="header" id="header">
        <?php require ('./vue/menu/menu.tpl'); ?>	
    </header>

    <!-- MAIN -->
    <main class="main">
        <?php require('./vue/' . $controle . '/' . $action . '.tpl'); ?>
    </main>

    <!-- FOOTER -->
  

    <!-- SCROLL UP -->

    <!-- SCROLL REVEAL -->

    <!-- SWIPER JS -->

    <!-- SWIPER JS -->
    <script src="./vue/styles/styleJS/swiper-bundle.min.js"></script>
    <!-- MAIN JS -->
    <script src="./vue/styles/styleJS/main.js"></script>
</body>
</html>