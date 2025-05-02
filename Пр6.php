<?php
header('Content-Type: application/json');

$notes = [];
$nextId = 1;

function getNoteById($id) {
    global $notes;
    foreach ($notes as $note) {
        if ($note['id'] == $id) {
            return $note;
        }
    }
    return null;
}

$method = $_SERVER['REQUEST_METHOD'];
$path = $_SERVER['PATH_INFO'] ?? '/notes';
$segments = explode('/', trim($path, '/'));
$resource = $segments[0];
$id = $segments[1] ?? null;

switch ($resource) {
    case 'notes':
        switch ($method) {
            case 'GET':
                if ($id) {
                    $note = getNoteById($id);
                    if ($note) {
                        echo json_encode($note);
                    } else {
                        http_response_code(404);
                        echo json_encode(['message' => 'Нотатку не знайдено']);
                    }
                } else {
                    echo json_encode(array_values($notes));
                }
                break;

            case 'POST':
                $data = json_decode(file_get_contents('php://input'), true);
                if (isset($data['title']) && isset($data['content'])) {
                    global $notes, $nextId;
                    $newNote = [
                        'id' => $nextId++,
                        'title' => htmlspecialchars($data['title']),
                        'content' => htmlspecialchars($data['content'])
                    ];
                    $notes[] = $newNote;
                    http_response_code(201);
                    echo json_encode($newNote);
                } else {
                    http_response_code(400);
                    echo json_encode(['message' => 'Потрібно вказати заголовок та вміст']);
                }
                break;

            case 'PUT':
                if ($id) {
                    $noteIndex = -1;
                    for ($i = 0; $i < count($notes); $i++) {
                        if ($notes[$i]['id'] == $id) {
                            $noteIndex = $i;
                            break;
                        }
                    }

                    if ($noteIndex !== -1) {
                        $data = json_decode(file_get_contents('php://input'), true);
                        if (isset($data['title'])) {
                            $notes[$noteIndex]['title'] = htmlspecialchars($data['title']);
                        }
                        if (isset($data['content'])) {
                            $notes[$noteIndex]['content'] = htmlspecialchars($data['content']);
                        }
                        echo json_encode($notes[$noteIndex]);
                    } else {
                        http_response_code(404);
                        echo json_encode(['message' => 'Нотатку не знайдено']);
                    }
                } else {
                    http_response_code(400);
                    echo json_encode(['message' => 'Не вказано ID нотатки для оновлення']);
                }
                break;

            case 'DELETE':
                if ($id) {
                    $initialCount = count($notes);
                    $notes = array_filter($notes, function ($note) use ($id) {
                        return $note['id'] != $id;
                    });
                    if (count($notes) < $initialCount) {
                        http_response_code(204);
                    } else {
                        http_response_code(404);
                        echo json_encode(['message' => 'Нотатку не знайдено']);
                    }
                } else {
                    http_response_code(400);
                    echo json_encode(['message' => 'Не вказано ID нотатки для видалення']);
                }
                break;

            default:
                http_response_code(405);
                echo json_encode(['message' => 'Метод не дозволено']);
                break;
        }
        break;

    default:
        http_response_code(404);
        echo json_encode(['message' => 'Ресурс не знайдено']);
        break;
}
?>