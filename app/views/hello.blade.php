<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sample App</title>
    <meta name="env" content="{{ App::environment() }}">
    <meta name="token" content="{{ Session::token() }}">
</head>
<body>

  <header></header>
  <div id="main-content"></div>
  <footer></footer>

  <!-- Dialog Region -->
  <div id="dialog" class="modal hide" tabindex="-1" data-replace="true"></div>

  <script src="/js/structure.js"></script>
  <script src="/js/app.js"></script>
  <script>
    $(document).ready(function() {
      SampleApp.start({
        user: {{ json_encode(array('id' => 1, 'name' => 'Luke')) }}
      });
    });
  </script>
</body>
</html>