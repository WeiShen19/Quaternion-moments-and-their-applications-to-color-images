function S = s(o)
% S Scalar part of a full octonion.

% Copyright � 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

S = s(o.a);

end
% $Id: s.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
