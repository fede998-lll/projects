% function [t0dot,tLdot]=Accelerations(t0,tL,P0,pm,Bi0,Bij,u0,um,u0dot,umdot,robot)
% Computes the operational-space accelerations (twist-rate) of the multibody system.
%
% [t0dot,tLdot]=Accelerations(t0,tL,P0,pm,Bi0,Bij,u0,um,u0dot,umdot,robot)
%
% :parameters: 
%   * t0 -- Base-link twist [\omega,rdot], projected in the inertial CCS -- as a [6x1] matrix.
%   * tL -- Manipulator twist [\omega,rdot], projected in the inertial CCS -- as a [6xn] matrix.
%   * Bij -- Twist-propagation matrix (for manipulator i>0 and j>0) -- as a [6x6xn] matrix.
%   * Bi0 -- Twist-propagation matrix (for i>0 and j=0) -- as a [6x6xn] matrix.
%   * P0 -- Base-link twist-propagation "vector" -- as a [6x6] matrix.
%   * pm -- Manipulator twist-propagation "vector" -- as a [6xn] matrix.
%   * u0 -- Base-link velocities [\omega,rdot]. The angular velocity is projected in the body-fixed CCS, while the linear velocity is projected in the inertial CCS -- [6x1].
%   * um -- Joint velocities -- [n_qx1].
%   * u0dot -- Base-link accelerations [\omegadot,rddot]. The angular acceleration is projected in a body-fixed CCS, while the linear acceleration is projected in the inertial CCS -- [6x1].
%   * umdot -- Manipulator joint accelerations -- [n_qx1].
%   * robot -- Robot model (see :doc:`/Tutorial_Robot`).
%
% :return: 
%   * t0dot -- Base-link twist-rate vector \omegadot,rddot], projected in inertial frame -- as a [6x1] matrix.
%   * tLdot -- Manipulator twist-rate vector \omegadot,rddot], projected in inertial frame -- as a [6xn] matrix.
%
% See also: :func:`src.kinematics_dynamics.Jacobdot`. 