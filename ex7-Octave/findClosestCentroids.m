function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%for i = 1:length(idx)
%    distance = zeros(K, 1);
%    for j = 1:K
%        % TODO(SaveTheRbtz@): Can be vectorized as diff * diff'
%        distance(j) = sum(sum((X(i, :) - centroids(j, :)) .^ 2 ));
%    endfor
%    [value, idx(i)] = min(distance);
%endfor


%K is total number of centroids
%loop over every training example and every centroid.
for i = 1:size(X,1)
	min = Inf;
	for j = 1:K
		diff = sum((X(i,:) - centroids(j,:)).^2);
		if min > diff
			min = diff;
			idx(i) = j;
		end
	end
end

% X: m*n
% centroids: K*n
%m = size(X,1);

%for i = 1:m,
%	min = sum((X(i,:) - centroids(1,:)).^2);
%	idx(i)=1;
%	for k = 1:K,
%		dist = sum((X(i,:) - centroids(k,:)).^2);
%		if (dist < min),
%			min = dist;
%			idx(i)=k;
%		end
%	end;
%end;


% =============================================================

end
