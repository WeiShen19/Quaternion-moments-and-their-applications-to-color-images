function n = norm(A, p)
% NORM   Matrix or vector norm.
% (Octonion overloading of standard Matlab function, with some limitations.)

% Copyright � 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 2, nargin)), error(nargoutchk(0, 1, nargout)) 

% We have to handle two different cases, depending on whether A is a vector
% or a matrix. The limiting case of a vector (a single quaternion) is handled
% using the vector case.

if nargin == 1
    n = norm(A, 2);
    return
end

[r,c] = size(A);

if isvector(A)
    % A is a vector.
    switch p
    case 1
        n = sum(abs(A));
    case 2
        n = sqrt(sum(normo(A)));
    % case other integer values of p are not supported, although the
    % standard Matlab norm function does handle them.
    case inf
        n = max(abs(A));
    case -inf
        n = min(abs(A));
    otherwise
        error('Illegal second parameter to octonion vector norm.')
    end
else
    % A is a matrix.
    % TODO Check for this explicitly using ismatrix (7.11 R2010b) and trap
    % cases where A is an array of more than 2 dimensions.
    switch p
    case 1
        n = max(sum(abs(A)));
    case 2
        error('Octonion SVD is not implemented, cannot calculate norm')
        t = svd(A);
        n = t(1);
    case inf
        n = max(sum(abs(A')));
    case 'fro'
        % This is coded more or less as defined for the standard Matlab norm
        % function, but it is necessary to take the scalar part of the diagonal
        % vector, because the result is quaternion-valued. A more efficient
        % coding would compute the column norms directly.
        n = sqrt(sum(s(diag(A'*A))));
    otherwise
        error('Illegal second parameter to octonion matrix norm.')
    end
end

% $Id: norm.m,v 1.2 2013/04/02 14:22:17 sangwine Exp $
