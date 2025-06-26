<?php

// Number of records to generate
$totalRecords = 100000; // Adjust as needed
$filename = "big_data.json";

// Open file for writing
$file = fopen($filename, "w");

// Start JSON array
fwrite($file, "[");

for ($i = 0; $i < $totalRecords; $i++) {
    // Generate random data
    $data = [
        "id" => $i + 1,
        "name" => "User" . ($i + 1),
        "email" => "user" . ($i + 1) . "@example.com",
        "age" => rand(18, 80),
        "phone" => "+1-555-" . rand(1000000, 9999999),
        "address" => [
            "street" => rand(100, 9999) . " Main St",
            "city" => "City" . rand(1, 100),
            "state" => "State" . rand(1, 50),
            "zipcode" => rand(10000, 99999),
            "country" => "USA"
        ],
        "status" => (rand(0, 1) == 1) ? "active" : "inactive",
        "balance" => round(rand(1000, 100000) / 100, 2),
        "ip_address" => rand(10, 255) . "." . rand(0, 255) . "." . rand(0, 255) . "." . rand(0, 255),
        "created_at" => date("Y-m-d H:i:s", strtotime("-" . rand(0, 365) . " days")),
        "updated_at" => date("Y-m-d H:i:s"),
        "preferences" => [
            "newsletter" => (rand(0, 1) == 1),
            "notifications" => (rand(0, 1) == 1),
            "theme" => (rand(0, 1) == 1) ? "dark" : "light"
        ]
    ];

    // Convert array to JSON string
    $jsonData = json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);

    // Write to file with comma if not the last record
    fwrite($file, $jsonData . ($i < $totalRecords - 1 ? "," : ""));
}

// End JSON array
fwrite($file, "]");

// Close the file
fclose($file);

echo "JSON file '$filename' generated successfully!\n";

?>
