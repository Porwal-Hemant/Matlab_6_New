% Define a complex-valued matrix A
A = [1+2i, 3-4i; 5+6i, 7-8i];

% Apply the operation by negating the imaginary parts using conj()
A_conj = conj(A);

% Display the original and modified matrices
disp('Original Matrix A:');
disp(A);

disp('Modified Matrix A (Negated Imaginary Parts):');
disp(A_conj);
