CREATE TABLE IF NOT EXISTS usable_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    label VARCHAR(50) NOT NULL,
    use_time INT NOT NULL,
    heal_amount INT NOT NULL,
    remove_item BOOLEAN NOT NULL
);

INSERT INTO usable_items (item_name, label, use_time, heal_amount, remove_item) VALUES
('bandage', 'Bandage', 5000, 50, true),
('medkit', 'Medkit', 10000, 100, true);