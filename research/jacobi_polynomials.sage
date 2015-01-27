var('x,a,b,k');

def mat_minor_entry(A,s,t,i,j):
	"""Helper method which returns the (i,j) entry of the matrix 
obtained by deleting the i^th row and the j^th column from the 
square matrix A.
	"""
	a = -1;
	b = -1;
	if i < s:
		a = s;
	else:
		a = s + 1;
	if j < t:
		b = t;
	else:
		b = t + 1;
	return A[a][b];

def mat_minor(A,s,t,R=QQ['a,b'].fraction_field()):
	"""Returns the matrix obtained by deleting the i^th row and j^th column
of the square matrix A.
"""
	n = A.nrows();
	B = matrix(R,n-1,n-1);
	for i in range(n-1):
		for j in range(n-1):
			B[i,j] = copy(mat_minor_entry(A,s,t,i,j));
	return B;

def full_minor(A):
	"""Returns a matrix (same size as A) whose (i,j) entry is the matrix
formed by deleting the i^th row and j^th column from the square 
matrix A.
"""
	n = A.nrows();
	B = zero_matrix(n,n);
	for i in range(n):
		for j in range(n):
			B[i][j] = mat_minor(A,i,j);
	return B;

def J(n,a,b,x):
	"""Returns the n^th Jacobi polynomial J_n^{(a,b)}(x).  a b and x may all
be treated as indeterminants.
"""
	s = 0;
	for j in range(n+1):
		s = s + binomial(n+a,n-j) * binomial(n+a+b+j,j) * x^j;
	return s;

def M(n,a,b,x):
	"""Returns the monic Jacobi polynomial (ie divide by J(n,a,b,x) by the 
leading coefficient.
"""
	return J(n,a,b,x) / binomial(n+a+b+n,n);

def power_sum_vector(f, l=-1):
	"""Given a polynomial f, will use Newton's identities to return
a vector whose i^th entry is the i^th power sum of f's roots. Previously
referred to as "NewtId".  The second (optional) argument tells how many
power sums to compute.
"""
	n = f.degree(x);
	g = f / f.coefficient(x,n);
	if l == -1:
		l = 2*n;
	A = [];
	for i in range(n+1):
		A.append((-1)^i * g.coefficient(x,n-i));
	for i in range(l):
		A.append(0);
	S = [n];
	for i in range(1,l+1):
		s = 0;
		for k in range(1,i):
			s = s + (-1)^(k+1)*A[k]*S[i-k];
		s = s + (-1)^(i+1)*i*A[i];
		S.append(s);
	return S;

def D(n,a,b,t):
	"""Returns the t x t matrix of power sums D_{n,t} = (s_{i+j-2}) as described
by Feit.
"""
	V = power_sum_vector(J(n,a,b,x));
	R = QQ['a,b'].fraction_field()
	M = matrix(R,t,t);
	for i in range(t):
		temp = []
		for j in range(t):
			M[i,j] = V[i+j];
	return M;

def Delta(n,a,b,t):
	"""Returns the determinant of D(n,a,b,t), referred to as Delta_{n,t} in
Feit's paper
"""
	return D(n,a,b,t).determinant();
