<?php
$errors = [];
$data = ['name' => '', 'age' => '', 'gender' => '', 'hobbies' => [], 'desc' => ''];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data['name'] = htmlspecialchars(trim($_POST['name']));
    $data['age'] = (int)$_POST['age'];
    $data['gender'] = $_POST['gender'] ?? '';
    $data['hobbies'] = $_POST['hobbies'] ?? [];
    $data['desc'] = htmlspecialchars(trim($_POST['desc']));

    if ($data['name'] === '') $errors['name'] = 'Введіть ім’я';
    if ($data['age'] < 10 || $data['age'] > 100) $errors['age'] = 'Вік має бути від 10 до 100';
    if ($data['gender'] === '') $errors['gender'] = 'Оберіть стать';

    if (!$errors) {
        echo "<h3>Результат:</h3>";
        echo "<p><b>Ім’я:</b> {$data['name']}</p>";
        echo "<p><b>Вік:</b> {$data['age']}</p>";
        echo "<p><b>Стать:</b> {$data['gender']}</p>";
        echo "<p><b>Хобі:</b> " . implode(', ', array_map('htmlspecialchars', $data['hobbies'])) . "</p>";
        echo "<p><b>Опис:</b> {$data['desc']}</p>";
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="uk">
<head><meta charset="UTF-8"><title>Анкета</title></head>
<body>
<h2>Анкета користувача</h2>
<form method="post">
  Ім’я: <input type="text" name="name" value="<?= $data['name'] ?>"><br>
  <span style="color:red"><?= $errors['name'] ?? '' ?></span><br>

  Вік: <input type="number" name="age" value="<?= $data['age'] ?>"><br>
  <span style="color:red"><?= $errors['age'] ?? '' ?></span><br>

  Стать:<br>
  <label><input type="radio" name="gender" value="Чоловіча" <?= $data['gender'] === 'Чоловіча' ? 'checked' : '' ?>> Чоловіча</label><br>
  <label><input type="radio" name="gender" value="Жіноча" <?= $data['gender'] === 'Жіноча' ? 'checked' : '' ?>> Жіноча</label><br>
  <span style="color:red"><?= $errors['gender'] ?? '' ?></span><br>

  Хобі:<br>
  <?php foreach (['Читання', 'Спорт', 'Музика'] as $hobby): ?>
    <label><input type="checkbox" name="hobbies[]" value="<?= $hobby ?>" <?= in_array($hobby, $data['hobbies']) ? 'checked' : '' ?>> <?= $hobby ?></label><br>
  <?php endforeach; ?>

  Опис:<br>
  <textarea name="desc"><?= $data['desc'] ?></textarea><br><br>

  <button type="submit">Надіслати</button>
</form>
</body>
</html>