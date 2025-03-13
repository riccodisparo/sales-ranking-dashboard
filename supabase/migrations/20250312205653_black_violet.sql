/*
  # Create sellers table and theme settings

  1. New Tables
    - `sellers`
      - `id` (uuid, primary key)
      - `name` (text)
      - `sales_value` (numeric)
      - `sales_target` (numeric)
      - `team` (text)
      - `photo_url` (text)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)
    
    - `theme_settings`
      - `id` (uuid, primary key)
      - `primary_color` (text)
      - `secondary_color` (text)
      - `accent_color` (text)
      - `logo_url` (text)
      - `company_name` (text)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on both tables
    - Add policies for authenticated users to:
      - Read all sellers
      - Manage sellers (create, update, delete)
      - Read and update theme settings
*/

-- Create sellers table
CREATE TABLE IF NOT EXISTS sellers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  sales_value numeric NOT NULL DEFAULT 0,
  sales_target numeric NOT NULL DEFAULT 0,
  team text NOT NULL CHECK (team IN ('PAYROLL', 'CREDIT_CARD')),
  photo_url text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create theme settings table
CREATE TABLE IF NOT EXISTS theme_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  primary_color text NOT NULL DEFAULT '#4F46E5',
  secondary_color text NOT NULL DEFAULT '#6366F1',
  accent_color text NOT NULL DEFAULT '#4338CA',
  logo_url text,
  company_name text NOT NULL DEFAULT 'Ricco',
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE sellers ENABLE ROW LEVEL SECURITY;
ALTER TABLE theme_settings ENABLE ROW LEVEL SECURITY;

-- Sellers policies
CREATE POLICY "Allow authenticated users to read sellers"
  ON sellers
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Allow authenticated users to insert sellers"
  ON sellers
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Allow authenticated users to update sellers"
  ON sellers
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow authenticated users to delete sellers"
  ON sellers
  FOR DELETE
  TO authenticated
  USING (true);

-- Theme settings policies
CREATE POLICY "Allow authenticated users to read theme settings"
  ON theme_settings
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Allow authenticated users to update theme settings"
  ON theme_settings
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Insert default theme settings
INSERT INTO theme_settings (company_name)
VALUES ('Ricco')
ON CONFLICT DO NOTHING;