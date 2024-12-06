variance = [100, 10, 1, 0.1, 0.01];
variance_Length = 5;

snr_ratio = [];
error = [];
theory_error = [];

% Constants
N = 100000;
A = 1;

% Generating random bit sequence
p_zero = 4/7;
p_one = 1 - p_zero;
bit_seq = randi([0 1], 1, N) < p_zero;

% Bipolar conversion of bit sequence
bipolar_seq = zeros(1, N);
for i = 1:N
    if bit_seq(i) == 0
        bipolar_seq(i) = -1;
    else
        bipolar_seq(i) = 1;
    end
end

scaled_seq = bipolar_seq * A;

for i = 1:variance_Length

    % Noise generation
    var_sig = variance(i);
    n = rand(1, N);
    w = sqrt(var_sig) * n + 0;

    % Adding noise to the scaled bipolar signal
    noisy_seq = scaled_seq + w;

    % Calculating SNR in dB
    snr = sqrt(1 / var_sig);
    snr_db = 10 * log(snr);

    % Theoretical error probability
    theory_answer = qfunc(snr);

    % Decoding the noisy signal
    decoded_signal = zeros(1, N);
    for j = 1:N
        if noisy_seq(j) > 0
            decoded_signal(j) = 1;
        else
            decoded_signal(j) = 0;
        end
    end

    % Calculating experimental error probability
    error_count = sum(bit_seq ~= decoded_signal);
    error_probability = error_count / N;

    % Storing results
    snr_ratio = [snr_ratio snr_db];
    error = [error error_probability];
    theory_error = [theory_error theory_answer];

end

% Displaying results
display(snr_ratio);
display(error);
display(theory_error);

% Plotting results
figure;
for k = 1:5
    stem(snr_ratio(k), error(k), 'b');
    hold on;
    stem(snr_ratio(k), theory_error(k), 'r');
end
hold off;

figure;
plot(variance, snr_ratio, '-o');
ylabel('SNR(dB)');
xlabel('Variance');
legend('SNR vs Variance');

figure;
plot(snr_ratio, error, '-o', 'DisplayName', 'Experimental Error Probability');
hold on;
plot(snr_ratio, theory_error, '-x', 'DisplayName', 'Theoretical Error Probability');
xlabel('SNR(dB)');
ylabel('Error Probability');
legend;
hold off;

figure;
plot(snr_ratio, error - theory_error, 'b--', 'DisplayName', 'Error Probability Difference');
xlabel('SNR(dB)');
ylabel('Error Probability Difference');
legend;


