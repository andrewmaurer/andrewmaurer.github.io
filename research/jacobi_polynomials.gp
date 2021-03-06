matminor(A,s,t)={
	n = matsize(A)[1];
	B = matrix(n-1,n-1);
	
	for(i=1,s-1,for(j=1,t-1,B[i,j]=A[i,j]));
	for(i=s+1,n,for(j=1,t-1,B[i-1,j]=A[i,j]));
	for(i=1,s-1,for(j=t+1,n,B[i,j-1]=A[i,j]));
	for(i=s+1,n,for(j=t+1,n,B[i-1,j-1]=A[i,j]));

	matdet(B)
};

fullminor(A)={
	n = matsize(A)[1];
	matrix(n,n,i,j,matminor(A,i,j))
};

NewtId(f)={
	n = poldegree(f);
	A = vector(2*n);
	for(j=1,n,A[j]=Vec(f)[j+1]*(-1)^j);
	for(j=n+1,2*n,A[j]=0);
	S = vector(2*n);
	S[1]=A[1];
	for(k=1,2*n,S[k]=sum(i=1,k-1,A[i]*S[k-i]*(-1)^(i+1)) + (-1)^(k+1)*k*A[k]);
	S;
};

J(n,a,b,x)=sum(j=0,n,binomial(n+a,n-j)*binomial(n+a+b+j,j)*x^j);

M(n,a,b,x)=J(n,a,b,x)/binomial(n+a+b+n,n);

co(n,a,b,i)=(-1)^i*binomial(n,i)*prod(j=0,i-1,n+a-j)/prod(j=0,i-1,2*n+a+b-j);

D(n,a,b,t)={
	V = vector(2*n+1);
	S = NewtId(M(n,a,b,x));
	V[1]=n;
	for(j=1,2*n,V[j+1]=S[j]);
	matrix(t,t,i,j,V[i+j-1]);
}

Delta(n,a,b,t)=matdet(D(n,a,b,t));
