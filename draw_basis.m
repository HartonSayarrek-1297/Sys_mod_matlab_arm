function p = draw_basis (home, vectors, sphere_onoff, brightness, index)
% home - position of origin
% vectors - coordinates of basis vectors
% sphere_onoff - boolean variable for drawing the sphere or not
% brightness - nigger
    arguments
        home (3, 1) double;
        vectors (3, 3) double;
        sphere_onoff (1, 1) logical = false;
        brightness (1, 1) double = 1;
        index (1, 1) string = "";
    end
    
    p1 = plot3([home(1), home(1) + vectors(1,1)], [home(2), home(2) + vectors(2,1)], [home(3), home(3) + vectors(3,1)], '-', 'Color',brightness.*[1 0 0]);
    p2 = plot3([home(1), home(1) + vectors(1,2)], [home(2), home(2) + vectors(2,2)], [home(3), home(3) + vectors(3,2)], '-', 'Color',brightness.*[0 1 0]);
    p3 = plot3([home(1), home(1) + vectors(1,3)], [home(2), home(2) + vectors(2,3)], [home(3), home(3) + vectors(3,3)], '-', 'Color',brightness.*[0 0 1]);
    p4 = text(home(1) + vectors(1,1), home(2) + vectors(2,1), home(3) + vectors(3,1), "X"+index);
    p5 = text(home(1) + vectors(1,2), home(2) + vectors(2,2), home(3) + vectors(3,2), "Y"+index);
    p6 = text(home(1) + vectors(1,3), home(2) + vectors(2,3), home(3) + vectors(3,3), "Z"+index);
    p = [p1 p2 p3 p4 p5 p6];
    % text(vectors(1,1), 0, 0, 'X');
    % text(0, vectors(2,2), 0, 'Y');
    % text(0, 0, vectors(3,3), 'Z');

    if (sphere_onoff == true)
        r = 2; % sphere radius
        fi = 10; % angle step (degrees)

        x1 = linspace(-r, r, 100);
        y1 = sqrt(r^2 - (x1.^2));
        z1 = linspace(0, 0, 100);
        plot3(x1, y1, z1, 'c', 'LineWidth',3);
        plot3(x1, (-1).*y1, z1, 'c', 'LineWidth',3); % "Equator" of sphere
        
        x2 = linspace(0, 0, 100);
        y2 = linspace(-r, r, 100);
        z2 = sqrt(r^2 - (y2.^2));
        plot3(x2, y2, z2, 'c');
        plot3(x2, y2, (-1).*z2, 'c'); % First ring

        M_rotation = [cosd(fi) -sind(fi) 0; % Rotation matrix for sphere rings drawing (axis - OZ)
                      sind(fi) cosd(fi) 0;
                      0 0 1];

        xyz_curr = M_rotation*[x2;y2;z2];
        plot3(xyz_curr(1,:), xyz_curr(2,:), xyz_curr(3,:), 'c');
        plot3(xyz_curr(1,:), xyz_curr(2,:), (-1).*xyz_curr(3,:), 'c');
        for i = 0:180/(fi)
            xyz_curr = M_rotation*xyz_curr;
            plot3(xyz_curr(1,:), xyz_curr(2,:), xyz_curr(3,:), 'c');
            plot3(xyz_curr(1,:), xyz_curr(2,:), (-1).*xyz_curr(3,:), 'c');
        end

    end
end