% Simulating the model with two different objects
mdl = 'testMdlVehicle';
in(1:4) = Simulink.SimulationInput(mdl);

vehicleObject = vehicle.sportSedan;
in(1) = in(1).setVariable('vehicleObject',vehicleObject);

vehicleObject = vehicle.luxurySedan;
in(2) = in(2).setVariable('vehicleObject',vehicleObject);

vehicleObject = vehicle.sportSedan;
vehicleObject.Suspension = suspension.twoDofLongitudinal;
vehicleObject.Body = body.luxury;
in(3) = in(3).setVariable('vehicleObject',vehicleObject);

vehicleObject = vehicle.sportSedan;
vehicleObject.Suspension = suspension.twoDofLateral;
vehicleObject.Suspension.Left = suspension.springDamperComplex;
vehicleObject.Suspension.Right = suspension.springDamperNonLinear;
in(4) = in(4).setVariable('vehicleObject',vehicleObject);

out = sim(in);

% Plot the position for one corner to confirm each run got different values
stackedplot(out(1).yout{1}.extractTimetable,...
    out(2).yout{1}.extractTimetable,...
    out(3).yout{1}.extractTimetable,...
    out(4).yout{1}.extractTimetable,"Data.FrontLeft.z");
