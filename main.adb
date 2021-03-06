-- aPharos is a simple Ada-based Ray Tracer.
-- Copyright (c) 2020.   Richard Scott McNew
--
-- aPharos is free software: you can redistribute it and / or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

with Ada.Text_IO;
with Geometry; use Geometry;
with Numbers; use Numbers;

procedure main is
    p : Point := (x => 3.1, y => 4.2, z => 6.3);
	v : Vector := (x => 1.0, y => 1.0, z => 1.0);
	n : Normal := (x => 2.3, y => 3.4, z => 4.5);
begin
    Ada.Text_IO.Put_Line(Image(p));
	Ada.Text_IO.Put_Line(Image(v));
	Ada.Text_IO.Put_Line(Image(n));
end main;

